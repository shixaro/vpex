package vpex_server::Index;
use Dancer2;
use utf8;
use LWP::UserAgent;
use LWP::Simple;
use DBI;
use JSON;
use HTML::HTMLDoc;
use strict;
use warnings;


use vars qw(%var);


any '/' => sub {
	
  template 'index', { 
     'VAR' => \%var,     
  },{layout => undef};
  

}; ## /

post '/go' => sub {
  
  my $dbh = &vpex_server::Sub::connect_db(); 
  my $ua = LWP::UserAgent->new();
  my $htmldoc = new HTML::HTMLDoc();
  
  $var{'ERROR'}=0;	
  $var{'VK_CLIENT_ID'} = 6275710;
  $var{'VK_SECRET'} = 'KaCbcqltfn5PAjOraJSo';
  $var{'VK_CALLBACK'} = 'http://app.tatyn.ru';
  
  my %json_request=();
  my $data = from_json(params->{'request'});
  while (my ($key, $value) = each %{$data}) {
    $json_request{$key}=$value;
    debug "key: $key :: ".$json_request{$key}."; value: ".$value."\n";
  } # while
    
  $var{'ERROR'}=4043 if !$json_request{'photos_count'}; 
  
  
  debug "AUTH. ".$json_request{'OAUTH_CODE'}."; ph count: $json_request{'photos_count'}; out_type: $json_request{'out_type'}; USER_ID: $var{'USER_ID'}; ERROR: $var{'ERROR'};";
  
  if ($json_request{'OAUTH_CODE'})
  {
    $var{'OAUTH_URL'}='https://oauth.vk.com/access_token?client_id='.$var{'VK_CLIENT_ID'}.'&client_secret='.$var{'VK_SECRET'}.'&code='.$json_request{'OAUTH_CODE'}.'&redirect_uri='.$var{'VK_CALLBACK'};
    debug localtime()." STANDALONE $var{'method_name'}; OAUTH URL: $var{'OAUTH_URL'};";
	 my $response = $ua->get ($var{'OAUTH_URL'}); 
     if ( $response->is_success() ) 
     {
	   my $obj = $response->content();
       debug localtime()." DEBUG. We`re get response DATA!!! data: $obj;";
       ($var{'TOKEN'}, $var{'EXPIRE'})=('', '');

       my %cycle_object=();
       $cycle_object{'err_code'}=$obj;
       my $data = from_json($obj);
       while (my ($key, $value) = each %{$data}) {
         $var{$key}=$value;    
         debug localtime()." DEBUG. cycle. KEY: $key; VALUE: $value;";
       } # while  
       
    } ## if ( $response->is_success() )        
  }
  
  if ($var{'ERROR'}==0)
  {
    my $url='http://srv.tatyn.ru/search_vk_photos/'.$json_request{'photos_count'}.'/'.$json_request{'rows_count'}.'?access_token='.$var{'access_token'}.'&user_id='.$var{'user_id'};
    debug " URL to search: $url;";
    my $response = $ua->get($url); 
                            
    if ( $response->is_success() ) 
    {
      my $obj = $response->content();
      $var{'REPLY'}=$obj if $json_request{'out_type'} eq 'HTML';
      if ($json_request{'out_type'} eq 'PDF')
      {
	    $htmldoc->set_html_content($obj);
        my $pdf = $htmldoc->generate_pdf();
        $pdf->to_file('public/reply.pdf');
        $var{'REPLY'}='http://srv.tatyn.ru/reply.pdf';
        #print $var{'REPLY'};
        
      }
    } ## if ( $response->is_success() ) 
    
  } ## if ($var{'ERROR'}==0)
    
  template 'go', { 
     'VAR' => \%var,
     
  }, {layout => undef};
  

}; ## /go



any '/search_vk_photos/:photos_count/:rows_count' => sub {

  my $ua = LWP::UserAgent->new();
  $var{'ERROR'}=0;	
  
  debug "method  HOSTDATA server_name: ".$ENV{"SERVER_NAME"}."; http_host: ".$ENV{"HTTP_HOST"}."; OWNER_ID: ".params->{'user_id'}."; TOKEN: ".params->{'access_token'}.";";
 
  $var{'ERROR'}=404 if !params->{'photos_count'}; 
  $var{'ERROR'}=405 if !params->{'rows_count'}; 
  $var{'ERROR'}=406 if !params->{'user_id'}; 
  $var{'ERROR'}=407 if !params->{'access_token'}; 
  
  my @vk_pics = ();        
  
  if ($var{'ERROR'}==0)
  {
	debug " search_vk_photos. photos_count: ".params->{'photos_count'}." rows_count: ".params->{'rows_count'}.";";
    my $vk_url='https://api.vk.com/method/photos.getAll?owner_id='.params->{'user_id'}.'&access_token='.params->{'access_token'}.'&count='.params->{'photos_count'}.'&v=5.69';
    my $vk_response = $ua->get($vk_url); 
                            
    if ( $vk_response->is_success() ) 
    {
      my $obj = $vk_response->content();
      my $dj = decode_json( $obj );

      eval {
        my $photo_count = $dj->{response}->{count};
        debug "VK PICS. photo_count: $photo_count;";
        my $i=0;
        while ($i<params->{'photos_count'}) {
          my $img_url=$dj->{response}->{items}->[$i]->{photo_130};
          $img_url=$dj->{response}->{items}->[$i]->{photo_75} if !$img_url;
          my $new_img_name=time().'_'.$i.'.jpg';
          debug " IMG URL: $img_url;";
          getstore($img_url, 'public/vk_pics/'.$new_img_name);

          my %row_data; 
          $row_data{ID} = $i;
          $row_data{PHOTO} = 'http://srv.tatyn.ru/vk_pics/'.$new_img_name;
          push(@vk_pics, \%row_data);
          $i++;
        } ## while
      }; ## eval
    
      
    } ## if ($vk_response->is_success()
    
  }  
  template 'search_vk_photos', { 
     'VAR' => \%var,
     'ROWS' => params->{'rows_count'},
     'VK_PICS' => \@vk_pics,
     
  }, {layout => undef};
  

}; ## /search_vk_photos






true;

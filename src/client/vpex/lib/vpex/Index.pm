package vpex::Index;
use Dancer2;
use utf8;
use LWP::UserAgent;
use DBI;
use JSON;
use LWP::Simple; ## temp
use Digest::MD5  qw(md5_hex);
use strict;
use warnings;


use vars qw(%var);


any '/' => sub {
  


  $var{'OAUTH_CODE'} = params->{'code'};

  template 'index', { 
     'VAR' => \%var,     
  };
  

}; ## /


post '/go' => sub {
  

  my $json = JSON->new;
  my $ua = LWP::UserAgent->new();
  
  $var{'ERROR'}=0;	
  #$var{'ERROR'}=4041 if !params->{'username'}; 
  #$var{'ERROR'}=4042 if !params->{'password'}; 
  
  
  $var{'OAUTH_CODE'} = params->{'OAUTH_CODE'};
  debug "GO. oauth_code: $var{'OAUTH_CODE'};";
  
  if ($var{'ERROR'}==0)
  {
        
    $var{'JSON_REQUEST'} = {
		             #'username' => params->{'username'},
                     #'password' => md5_hex(params->{'password'}),
                     'OAUTH_CODE' => params->{'OAUTH_CODE'},
                     'photos_count' => params->{'photos_count'},
                     'rows_count' => params->{'rows_count'},
                     'out_type' => params->{'out_type'}                     
                   };																																																																																											                             																																																																																					             
    $var{'JSON_REQUEST'}  = to_json($var{'JSON_REQUEST'}, {ascii => 1});  
    
    
    my $auth_url='http://srv.tatyn.ru/go';
  
    my $auth_response = $ua->post ($auth_url, [ 'request' => $var{'JSON_REQUEST'} ]); 
                                  
    if ( $auth_response->is_success() ) 
    {
      $var{'REPLY'} = $auth_response->content();
      debug "We`re get response DATA!!! data: $var{'REPLY'};";
      #print $var{'REPLY'};
      
      if (params->{'out_type'} eq 'PDF')
      {
		debug "SAVE PDF";
        getstore($var{'REPLY'}, 'public/reply.pdf');
        undef($var{'REPLY'});
        
        response_headers 'Content-type' => 'application/pdf', 'Content-Disposition' => 'inline', 'filename' => 'reply.pdf';

        my $pdfFile = 'public/reply.pdf';
        open(my $pdf, '<', $pdfFile);
        binmode $pdf;
        binmode STDOUT;
        my $buffer;
        while (read($pdf, $buffer, 1024, 0)) {
        
           $var{'REPLY'}.=$buffer;
        }
        close($pdf);
        print $var{'REPLY'};
      }
    
    } 
    

  } ## if ($var{'ERROR'}==0)
    
  template 'go', { 
     'VAR' => \%var,
     
  }, {layout => undef};
  

}; ## /






true;

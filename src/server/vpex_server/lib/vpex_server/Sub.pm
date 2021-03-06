package vpex_server::Sub;
use Dancer2;
use utf8;
use DBI;

use vars qw($dbh $memd %var %forumconfig);

sub connect_db {
  my $dbhost="127.0.0.1";
  my $dbport=3306;
  my $dbname="vpex";
  my $dbuser="vpex";
  my $dbpass="password";
  my $dbh = DBI->connect("DBI:mysql:$dbname:$dbhost:$dbport",$dbuser,$dbpass, {mysql_enable_utf8=>1});
  $dbh->do("set character set utf8");
  $dbh->do("set names utf8");
  return $dbh;
}

sub check_session_params {
  $var{'UID'}=session 'user_id';
  $var{'USERNAME'}=session 'username';
  $var{'USER_LEVEL'}=session 'user_level';
  $var{'UID'}=-666 if !$var{'UID'};
}

sub check_dbh {
  debug "sub check_dbh called.";
  if (!$dbh)	
  {
	debug "NO DBH connect... trying reconnect!";
    $dbh = &connect_db();
  }
  if ($dbh)
  {
    my $sth=$dbh->prepare(q{ SELECT NOW()});
    eval {$sth->execute(); 
	};
    if ($@ || $dbh->errstr) 
    {
	  debug "getted db connect error. dbh db; reconnecting...";
	  $dbh->disconnect;
      $dbh = &connect_db();
    }
  }
}



true;

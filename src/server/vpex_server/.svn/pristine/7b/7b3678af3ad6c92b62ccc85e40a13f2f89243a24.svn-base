package vpex_server;
use Dancer2;
use utf8;
use AnyEvent;
use DBI;
use strict;
use warnings;


use vpex_server::Index;
use vpex_server::Sub;

use vars qw(%var);

our $VERSION = '0.1';
set logger => 'file';
&vpex_server::Sub::check_dbh();



start;

true;

use strict;
use warnings;
use Test::More;


use Catalyst::Test 'CatalystBasic';
use CatalystBasic::Controller::Logot;

ok( request('/logot')->is_success, 'Request should succeed' );
done_testing();

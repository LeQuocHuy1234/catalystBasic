use strict;
use warnings;

use CatalystBasic;

my $app = CatalystBasic->apply_default_middlewares(CatalystBasic->psgi_app);
$app;


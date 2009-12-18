use strict;
use warnings;
use Test::More tests => 6;

BEGIN { use_ok 'Catalyst::Test', 'Nagios::Web' }
BEGIN { use_ok 'Nagios::Web::Controller::histogram' }

ok( request('/histogram')->is_success, 'Histogram Request should succeed' );
my $request = request('/nagios/cgi-bin/histogram.cgi');
ok( $request->is_success, 'Histogram Request should succeed' );
my $content = $request->content;
TODO: {
    local $TODO = "needs to be implemented";
    like($content, qr/Host and Service Alert Histogram/, "Content contains: Host and Service Alert Histogram");
};
unlike($content, qr/errorMessage/mx, "Content doesnt contains: errorMessage");
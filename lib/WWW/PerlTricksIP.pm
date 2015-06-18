use strict;
use warnings;
package WWW::PerlTricksIP;

use HTTP::Tiny;
use 5.008;

# ABSTRACT: Returns your ip address using L<http://perltricks.com/services/echo_ip>

=head1 SYNOPSIS

    use WWW::PerlTricksIP;

    my $ip = get_ip(); # 54.123.84.6

=head1 EXPORTS

Exports the C<get_ip> function.

=cut

BEGIN {
    require Exporter;
    use base 'Exporter';
    our @EXPORT = 'get_ip';
    our @EXPORT_OK = ();
}

=head1 FUNCTIONS

=head2 get_ip

Returns your ip address using L<http://perltricks.com/services/echo_ip>.

    use WWW::PerlTricksIP;

    my $ip = get_ip();

=cut

sub get_ip {
    my $response = HTTP::Tiny->new->get('http://perltricks.com/services/echo_ip');
    return $response->{content} if $response->{success};
    die join(' ', 'Error fetching ip: ',
                  ($response->{status} or ''),
                  ($response->{reason} or ''));
}

=head1 SEE ALSO

L<WWW::hmaip> - another module that returns your ip address

L<WWW::ipinfo> - a module that returns ip address and geolocation data

=cut

1;

package CatalystBasic::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    INCLUDE_PATH => [
        CatalystBasic->path_to('root'),
    ],
    TIMER => 0,
    render_die => 1,
);

=head1 NAME

CatalystBasic::View::HTML - TT View for CatalystBasic

=head1 DESCRIPTION

TT View for CatalystBasic.

=head1 SEE ALSO

L<CatalystBasic>

=head1 AUTHOR

lequochuy,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

package CatalystBasic::Controller::Login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

CatalystBasic::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};

    if ($username && $password) {
        if ($c->authenticate({ username => $username, password => $password })) {
            $c->response->redirect($c->uri_for($c->controller('User')->action_for('list')));
            # $c->response->redirect($c->uri_for('/user/list/'));
            return;
        }
        $c->flash(error_message => "Tai khoan mat khau chua dung");
    }

    $c->stash(template => 'login.tt');
}



=encoding utf8

=head1 AUTHOR

lequochuy,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

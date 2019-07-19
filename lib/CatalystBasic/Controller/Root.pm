package CatalystBasic::Controller::Root;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

CatalystBasic::Controller::Root - Root Controller for CatalystBasic

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub hello :Global {
    my ( $self, $c ) = @_;
    $c->stash->{data} = 'Huy';
    $c->log->info("Starting the foreach loop here");
    # $c->stash(template => 'hello.tt', dataTwo => 'Hoang');    
}

sub list :Local {
    my ( $self, $c ) = @_;
    
    $c->stash(template => 'list.tt')
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub auto : Private {
    my ( $self, $c ) = @_;

    if ($c->controller eq $c->controller('login')) {
        return 1;
    }

    if (!$c->user_exists) {
        $c->response->redirect($c->uri_for('/login'));
        return 0;
    }

    return 1;
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

lequochuy,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

package CatalystBasic::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

CatalystBasic::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub list :Path {
    my ( $self, $c ) = @_;
    if($c->check_user_roles('admin')) {
        $c->log->info('debug code');
        $c->stash(users => [$c->model('DB::User')->all]);
        $c->stash(template => 'user/list.tt');
    } else {
        $c->response->body('Khong cap quyen!');
    }
}


# Cach khai bao 1

# sub url_create :Local {
#     my ($self, $c, $name, $address) = @_;

#     my $book = $c->model('DB::User')->create({
#         name => $name,
#         address => $address
#     });

#     $c->stash(template => 'user/list.tt');
#     $c->response->header('Cache-Control' => 'no-cache');
# }

# Cach khai bao 2

sub url_create :Chained('/') :PathPart('create_url/user') :Args(2){
    my ($self, $c, $name, $address) = @_;

    $c->model('DB::User')->create({
        name => $name,
        address => $address
    });

    $c->response->redirect('/user/list');
    $c->response->header('Cache-Control' => 'no-cache');
}

sub create :Chained('/') :PathPart('user/create') :Args(0) {
    my ($self, $c) = @_;

    $c->stash(template => 'user/create.tt');
}

sub store :Chained('/') :PathPart('user/store') :Args(0) {
    my ($self, $c) = @_;
    my $name = $c->request->params->{name} || 'ko co';
    my $address = $c->request->params->{address} || 'ko co';
    
    $c->model('DB::User')->create({
        name => $name,
        address => $address
    });

    $c->response->redirect($self->action_for('list'));
}

sub delete :Chained('/') :PathPart('user/delete') :Args(1) {
    my ($self, $c, $id) = @_;

    if ($c->check_user_roles('delete')) {
        $c->model('DB::User')->find($id)->delete;

        $c->response->redirect($self->action_for('list'));
    } else {
        $c->response->body('Khong cap quyen!');
    }
}

sub edit :Chained('/') :PathPart('user/edit') :Args(1) {
    my ($self, $c, $id) = @_;
    my $data = $c->model('DB::User')->find($id);
    $c->stash(user => $data);
    $c->stash(template => 'user/update.tt');
}


sub update :Chained('/') :PathPart('user/update') :Args(1) {
    my ($self, $c, $id) = @_;
    my $name = $c->request->params->{name}  || 'ko co';
    my $address = $c->request->params->{address} || 'ko co';

    my $data = $c->model('DB::User')->find($id)->update({
        name => $name,
        address => $address
    });

    $c->response->redirect($self->action_for('list'));
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

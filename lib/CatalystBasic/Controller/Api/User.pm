package CatalystBasic::Controller::Api::User;
use Moose;
use namespace::autoclean;
use JSON;
use Data::Dumper;

__PACKAGE__->config(default => 'text/x-json');

=head1 NAME

CatalystBasic::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

BEGIN { extends 'Catalyst::Controller::REST' }

sub user :Local :ActionClass('REST'){}

# sub user_GET {
#   my ( $self, $c ) = @_;

#   my @result = $c->model('DB::User')->all;

#   $self->status_ok(
#         $c,
#         entity => {
#             data => @result,
#       },
#   );
# }

sub user_POST {
      my ( $self, $c, $id ) = @_;
      my $name = $c->request->params->{name} || 'ko co';
      my $address = $c->request->params->{address} || 'ko co';

      $c->model('DB::User')->create({
            name => $name,
            address => $address
      });
      
      $self->status_ok(
            $c,
            entity => {
                  success => 'Thanh cong',
            },
      );
}

sub user_PUT {
      my ( $self, $c ) = @_;
      my $name = $c->request->params->{name};
      my $address = $c->request->params->{address};
      my $id = $c->request->params->{id};
      
      if ($name && $address) {
            $c->model('DB::User')->find($id)->update({
                  name => $name,
                  address => $address
            });
      } else {
            $c->model('DB::User')->find($id)->delete
      }

      $self->status_ok(
            $c,
            entity => {
                  success => 'Thanh cong',
            },
      );
}

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched CatalystBasic::Controller::User in User.');
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

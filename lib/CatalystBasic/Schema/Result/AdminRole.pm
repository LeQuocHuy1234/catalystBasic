use utf8;
package CatalystBasic::Schema::Result::AdminRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

CatalystBasic::Schema::Result::AdminRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<admin_role>

=cut

__PACKAGE__->table("admin_role");

=head1 ACCESSORS

=head2 admin_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 role_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "admin_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "role_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<admin_id_UNIQUE>

=over 4

=item * L</admin_id>

=back

=cut

__PACKAGE__->add_unique_constraint("admin_id_UNIQUE", ["admin_id"]);

=head2 C<role_id_UNIQUE>

=over 4

=item * L</role_id>

=back

=cut

__PACKAGE__->add_unique_constraint("role_id_UNIQUE", ["role_id"]);

=head1 RELATIONS

=head2 admin

Type: belongs_to

Related object: L<CatalystBasic::Schema::Result::Admin>

=cut

__PACKAGE__->belongs_to(
  "admin",
  "CatalystBasic::Schema::Result::Admin",
  { id => "admin_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 role

Type: belongs_to

Related object: L<CatalystBasic::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "CatalystBasic::Schema::Result::Role",
  { id => "role_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-07-23 13:37:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1FzWH5ebd7JITBDRq/0Fdw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

package Data::Validator::Role::Ordered;

use strict;
use warnings FATAL => "all";
use Mouse::Role;

=head1 MODIFIERS

=over 4

=item validate

Return a list, in order, of arguments rather than the result.

=back

=cut

around validate => sub {
    my ($next, $self, @args) = @_;

    my $args = $self->$next(@args);

    return map $args->{$_->{name}}, @{ $self->rules };
};

1;

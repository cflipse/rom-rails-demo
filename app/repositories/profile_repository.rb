# frozen_string_literal: true

class ProfileRepository < ROM::Repository::Root

  root :profiles

  commands :create, update: :by_pk, delete: :by_pk

  struct_namespace RomRailsDemo

end

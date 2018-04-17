class ProfilesRelation < ROM::Relation[:sql]
  gateway :default

  schema(:profiles, infer: true)

  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end

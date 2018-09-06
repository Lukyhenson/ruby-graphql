Types::UserType = GraphQL::ObjectType.define do
  name "UserType"

  field :id, types.ID
  field :name, types.String
  field :email, types.String
  field :phone_number, types.String
  field :is_admin, types.Boolean, "Admin user?"

  field :country do
    type Types::CountryType
    description "Country associate to this user"
    resolve ->(user, args, context) {
      user.country
    }
  end
end
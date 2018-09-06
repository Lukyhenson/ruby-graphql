class Mutations::CreateUser < GraphQL::Function
  argument :id, types.ID
  argument :name, types.String
  argument :email, types.String
  argument :phone_number, types.String
  argument :is_admin, types.Boolean
  argument :country_id, types.ID

  type Types::UserType

  def call(obj, args, context)
    User.create(args.to_h)
  end
end
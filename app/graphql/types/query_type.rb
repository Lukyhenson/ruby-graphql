Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :user, Types::UserType do
    argument :id, types.ID
    description "User identification"

    resolve -> (obj, args, ctx) {
      User.where(id: args[:id]).first
    }
  end

  field :allUsers, !types[Types::UserType] do
    resolve -> (obj, args, ctx) {
      User.all.order(id: :asc)
    }
  end
end

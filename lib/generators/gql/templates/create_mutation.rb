module Mutations
  class <%= prefixed_class_name('Create') %> < Mutations::BaseMutation
    field :<%= singular_name %>, Types::<%= name %>Type, null: true
    field :errors, [String], null: true 

    argument :attributes, Types::Input::<%= name %>Input, required: true

    def resolve(attributes:)
      model = ::<%= class_name %>.create(attributes.to_h)
      
      {
        <%= singular_name %>: model,
        errors: model.errors.full_messages
      }
      
    end
  end
end
module Mutations
  class <%= prefixed_class_name('Update') %> < Mutations::BaseMutation
    field :<%= singular_name %>, Types::<%= name %>Type, null: true
    field :errors, [String], null: true 

    argument :id, Int, required: true
    argument :attributes, Types::Input::<%= name %>Input, required: true
    
    def resolve(attributes:, id:)
      model = ::<%= class_name %>.find(id)

      model.update(attributes.to_h)
      
      {
        <%= singular_name %>: model,
        errors: model.errors.full_messages
      }
        
    end
  end
end
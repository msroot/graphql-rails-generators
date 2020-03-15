module Mutations
  class <%= prefixed_class_name('Delete') %> < Mutations::BaseMutation
    field :<%= singular_name %>, Types::<%= name %>Type, null: true
    field :errors, [String], null: true 
    argument :id, Int, required: true

    def resolve(id:)
      model = ::<%= class_name %>.find(id)

      errors = model.destroy ? [] : model.errors.full_messages
            
      {
        <%= singular_name %>: model,
        errors: errors
      }
      
    end
  end
end
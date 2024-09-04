# frozen_string_literal: true

module Contact
  class CreateContact
    include Interactor

    delegate :contact_params, to: :context

    def call
      contact = Contact.new(contact_params)

      if contact.save
        context.contact = contact
      else
        context.fail!(errors: contact.errors.full_messages.to_sentence)
      end
    end
  end
end
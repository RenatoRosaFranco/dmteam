# frozen_string_literal: true

module Contacts
  class CreateContact
    include Interactor

    delegate :contact_params, to: :context

    def call
      contact = Contact.new(contact_params)

      if contact.valid?
        context.send_email
      else
        context.fail!(errors: contact.errors.full_messages.to_sentence)
      end
    end
  end
end
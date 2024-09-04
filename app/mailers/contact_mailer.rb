# frozen_string_literal: true

class ContactMailer < ApplicationMailer

  def sended(contact)
    @contact = contact
    mail(
      subject: 'Contact Form Submission',
      to: 'from@example.org'
    )
  end

  def received(contact)
    @contact = contact
    mail(
      subject: 'Thank you for your message',
      to: contact.email
    )
  end
end

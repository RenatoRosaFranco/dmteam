# frozen_string_literal: true

class Contact < Object
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include Mailerable

  attr_accessor :name, :email, :phone, :subject, :message

  def initialize(attributes = {})
    attributes.each { |key, value| send("#{key}=", value) }
  end

  def persisted?
    false
  end

  def send_email
    mail_to(@mailer, :sended)
    mail_to(@mailer, :received)
  end
end

# frozen_string_literal: true

module Mailerable
  include ActiveSupport::Concern

  def mail_to(mailer, action, object = self, deliver_method = :deliver_now)
    mailer.public_send(action, object).send(deliver_method)
  rescue Exception => e
    Rails.logger.error "Failed to send email for #{self.class.name} (#{e})"
    raise StandardError, e
  end
end
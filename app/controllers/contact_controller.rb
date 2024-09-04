# frozen_string_literal: true

class ContactController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    result = Contact::CreateContact.call(contact_params: contact_params)

    if result.success?
      flash[:notice] = I18n.t('flash.contacts.create.success')
      redirect_to contact_path
    else
      flash[:error] = result.error
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(*contact_attributes)
  end

  def contact_attributes
    %w[name email phone subject message]
  end
end

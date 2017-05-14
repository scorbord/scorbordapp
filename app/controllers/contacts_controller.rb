class ContactsController < ApplicationController
  before_filter :find_relatable

  def new
    @contact = @relatable.contacts.new
  end

  def create
    @contact = @relatable.contacts.new(contact_params)
    if @contact.save
      redirect_to @relatable
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      redirect_to @contact.relatable
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.delete
      flash[:success] = "#{@contact.first_name} deleted from contacts"
      redirect_to @contact.relatable
    else
      flash[:error] = "unable to delete"
      redirect_to @contact.relatable

    end
  end

  private

    def contact_params
      params.require(:contact).permit(
        :relation,
        :salutation,
        :first_name,
        :last_name,
        :primary_phone,
        :secondary_phone,
        :email,
        :facebook,
        :twitter,
        :instagram,
        :snapchat
      )
    end

    def find_relatable
      if params[:member_id]
        @relatable = Member.find(params[:member_id])
      elsif params[:prospect_id]
        @relatable = Prospect.find(params[:prospect_id])
      end
    end
end

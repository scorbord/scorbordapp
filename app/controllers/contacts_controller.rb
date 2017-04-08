class ContactsController < ApplicationController

  def new
    @prospect = Prospect.find(params[:prospect_id])
    @contact = @prospect.contacts.new
  end

  def create
    @prospect = Prospect.find(params[:prospect_id])
    @contact = @prospect.contacts.new(contact_params)
    if @contact.save
      redirect_to @contact.prospect
    end
  end

  def edit
    @prospect = Prospect.find(params[:prospect_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(contact_params)
      redirect_to @contact.prospect
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.delete
      flash[:success] = "#{@contact.first_name} deleted from contacts"
      redirect_to @contact.prospect
    else
      flash[:error] = "unable to delete"
      redirect_to @contact.prospect

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
end

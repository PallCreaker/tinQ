class Users::RegistrationsController < Devise::RegistrationsController
  def cancel
    super
  end

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

=begin
  def update
    super
  end
=end

  def update
    @user = User.find(current_user.id)
    if @user.update_without_current_password(params[:user])
      sign_in @user, bypass: true
      set_flash_message :notice, :updated
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
 
    #if update_resource(resource, account_update_params)
    if resource.update_without_current_password(account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def destroy
    super
  end

  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
end

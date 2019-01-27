# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @user = User.new
  end

  # PUT /resource
  def update
    @user = User.find(params[:user][:id])

    if @user.update_attributes(configure_account_update_params)
      
      # params[:langs].each do |lang|
      #   Lang.create(lang_list_id: lang.to_i,user_id: current_user.id)
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
      
    end
      
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  
  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
  def after_inactive_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :family_name, :middle_name, :gender, :nationality, :residence_country, :hobby, :hope, :university, :major, :user_image])
  end
  
  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

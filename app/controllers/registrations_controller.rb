class RegistrationsController < Devise::RegistrationsController
  def create
    super
    resource.add_new_languages(params[:new_languages]) if resource.valid?
  end

  def update
    super
    resource.add_new_languages(params[:new_languages]) if resource.valid?
  end
end
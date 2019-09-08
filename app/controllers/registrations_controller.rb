class RegistrationsController < Devise::RegistrationsController 
  def create
    super
    Cart.create(user: current_user)
  end
end
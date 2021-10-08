module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    resource ||= User.new
    resource
  end

  def devise_mapping
    devise_mapping ||= Devise.mappings[:user]
    devise_mapping
  end
end

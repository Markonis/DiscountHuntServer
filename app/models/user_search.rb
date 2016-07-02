class UserSearch < ActiveRecord::Base

  belongs_to :user

  before_create :set_result

  def set_result
    self.result = users_to_builder(perform_search).target!
  end

  def perform_search
    relation = if query.present?
      User.where('first_name LIKE :query OR last_name LIKE :query OR phone LIKE :query', query: "%#{query}%")
    else
      User.all
    end

    if hardware_uuid.present?
      relation = relation.includes(:user_devices)
        .where(user_devices: {hardware_uuid: hardware_uuid})
    end

    relation.includes(:photo, :location)
  end

  def users_to_builder(users)
    Jbuilder.new do |json|
      json.array! users do |user|
        json.extract! user, :first_name, :last_name
        json.photo user.photo
        json.location user.location
      end
    end
  end
end

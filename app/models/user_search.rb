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
      relation = relation.joins(:user_devices)
        .where(user_devices: {hardware_uuid: hardware_uuid})
    end

    if friends_with.present?
      user_ids = Friendship.by_user(friends_with)
        .flat_map {|f| [f.user_a_id, f.user_b_id]}
        .reject {|id| id == friends_with }.uniq
      relation = relation.where(id: user_ids)
    end

    relation.includes(:photo, :location)
  end

  def users_to_builder(users)
    Jbuilder.new do |json|
      json.array! users do |user|
        json.extract! user, :id, :first_name, :last_name
      end
    end
  end
end

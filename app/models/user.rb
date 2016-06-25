class User < ActiveRecord::Base

  belongs_to :photo
  belongs_to :location
  has_one :setting, dependent: :destroy
  has_many :discounts, dependent: :destroy

  validates_presence_of :location, :photo, :first_name, :last_name, :phone,
    :username, :password

  # after_create :create_setting
  before_destroy :destroy_friendships

  attr_encrypted :password, key: 'This is a key that is 256 bits!!'

  def friendships
    Friendship.by_user(self.id)
  end

  def friends
    friends_a = Friendship.where(user_a_id: self.id)
      .includes(:user_b).map {|f| f.user_b}
    friends_b = Friendship.where(user_b_id: self.id)
      .includes(:user_a).map {|f| f.user_a}

    friends_a + friends_b
  end

  def destroy_friendships
    friendships.each(&:destroy)
  end
end

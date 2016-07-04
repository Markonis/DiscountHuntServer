class User < ActiveRecord::Base

  belongs_to :photo
  belongs_to :location
  has_one :setting, dependent: :destroy, inverse_of: :user
  has_many :discounts, dependent: :destroy, inverse_of: :user
  has_many :user_devices, dependent: :destroy, inverse_of: :user
  has_many :user_location_changes, dependent: :destroy, inverse_of: :user
  has_many :discount_votes, dependent: :destroy, inverse_of: :user

  validates_uniqueness_of :username
  validates_presence_of :first_name, :last_name, :phone,
    :username, :password

  accepts_nested_attributes_for :user_devices, :photo

  after_initialize :set_test_password if Rails.env.test?
  after_create :create_setting
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

  def rank
    discounts.includes(:discount_votes).flat_map(&:discount_votes).size
  end

  def set_test_password
    self.password = '123456'
  end

  def self.by_credentials(username, password)
    user = User.where(username: username).first
    if user.present? && user.password == password
      user
    else
      nil
    end
  end
end

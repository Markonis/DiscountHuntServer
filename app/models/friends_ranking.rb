class FriendsRanking < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user

  before_create :set_result

  def set_result
    self.result = users_to_builder(assemble_list).target!
  end

  def assemble_list
    list = user.friends + [user]
    list.sort_by {|user| user.rank}
  end

  def users_to_builder(list)
    Jbuilder.new do |json|
      json.array! list do |user|
        json.extract! user, :id, :first_name, :last_name, :rank
      end
    end
  end
end

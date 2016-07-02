class FriendshipValidator < ActiveModel::Validator
  def validate(record)
    friendships = query_friendships record
    unless uniq?(record, friendships)
      record.errors[:base] << 'There is already such friendship.'
    end
  end

  def query_friendships(record)
    Friendship.where('(user_a_id = :a AND user_b_id = :b) OR (user_b_id = :a AND user_a_id = :b)',
      a: record.user_a_id, b: record.user_b_id)
  end

  def uniq?(record, friendships)
    friendships.count == 0 ||
    (friendships.count == 1 && friendships.first.id == record.id)
  end
end
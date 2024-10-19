class Follower < ApplicationRecord
  validates :check_if_user_blocked, on: :create

  def check_if_user_blocked
    # from_id, to_id
    # Raj going to follow Lakshya
    if BlockedUsers.find(blocked_user_id_id: from_id, for_user_id: to_id).exists?
      errors.add(:base, "Not allowed since blocked")
    end
    # Blocked user for_user_id->Raj blocked_user_id_id->Lakshya
    # Lakshya->from_id tried to follow Raj->to_id

  end
end

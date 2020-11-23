class Message < ApplicationRecord
  belongs_to :user

  def username
    user.username
  end

end

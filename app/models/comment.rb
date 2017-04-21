class Comment < ApplicationRecord
	has_many :likes
	belongs_to :user
	belongs_to :article

	def like?(user)
		Like.where(user_id: user.id).present?
	end
end

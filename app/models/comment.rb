class Comment < ApplicationRecord
	has_many :likes
	belongs_to :user
	belongs_to :article
end

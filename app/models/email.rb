class Email < ApplicationRecord
	validates :sender, :recipient, :subject, :body, :thread_id, presence: true
end

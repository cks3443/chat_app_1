class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'user1_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'user2_id'
  has_many :messages
end

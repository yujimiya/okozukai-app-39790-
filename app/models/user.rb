class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :role

  validates :nickname, :goal_price, :unit_price, :child_nickname, presence: true
  # validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'は、半角英数字混合である必要があります' }
  validates :role_id, numericality: { other_than: 1, message:"Please select"}

  has_many :events
end

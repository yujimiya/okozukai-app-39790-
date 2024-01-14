class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to:family_member
  # has_many: events

validates :nickname, presence: true
validates :passwoerd, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'は、英数字混合である実用があります' }
validates :role_id, presence: true
end

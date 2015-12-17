class User < ActiveRecord::Base
  belongs_to :owner

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         :confirmable

  validates :name, presence: true, uniqueness: false
end

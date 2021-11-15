class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :description, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

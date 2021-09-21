class User < ApplicationRecord
  def admin_exist_check
    throw :abort if self.admin? && User.where(admin: true).count == 1
  end
  def admin_exist_check_update
    throw :abort if self.admin == false && User.where(admin: true).count == 1
  end
  before_destroy :admin_exist_check
  before_update :admin_exist_check_update
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy
end

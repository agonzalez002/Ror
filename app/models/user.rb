class User < ActiveRecord::Base
  has_many :photos
  validates :email, :first_name, :last_name, presence: true
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end

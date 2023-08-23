class User < ApplicationRecord
  has_many :items
  has_many :bids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:buyer, :seller, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :buyer
  end

end

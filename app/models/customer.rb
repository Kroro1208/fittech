class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :status
  end
  enum status: {
    normal: 0,
    withdrawn: 1,
    banned: 2
  }

  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= :normal
  end
end

class User < ApplicationRecord
  has_many :reservations

  before_save { self.email = email.downcase }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/.freeze

  validates :name, presence: true,
                   length: { maximum: 20 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: {
                      with: VALID_EMAIL_REGEX,
                      allow_blank: true,
                    }
  validates :password, presence: true,
                       format: {
                         with: VALID_PASSWORD_REGEX,
                         message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります",
                       }

  def self.user_order
    order(day: :desc)
  end
end

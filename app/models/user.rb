class User < ApplicationRecord

  has_many :reviews, dependent: :destroy #delete user=>deletes their reviews from db
  has_many :restaurants, through: :reviews, dependent: :destroy #delete user=>delete restaurant from db

  before_save { self.email = email.downcase } #AR callback
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  extend FriendlyId
  scope :active, -> {where(:active => true)}
  friendly_id :email, :use => [:finders]
    
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.alphabetical_order #ActiveRecord method to alphabetize lists
    User.order(email: :asc)
  end

end

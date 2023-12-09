class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

    before_save { self.email = email.downcase }
  
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\z/ },
                      uniqueness: true
  
    validates :birth_date, presence: true
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :terms_accepted, acceptance: {accept: true}

  
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    validates :telephone_number, presence: true
  end
  
class User < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    validates :email, presence: true
    validates :email, uniqueness: true

    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password

    def User.digest(string)  # 引数ハッシュ値返す
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
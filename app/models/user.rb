class User < ApplicationRecord
    attr_accessor :remember_token
    before_save { self.email = email.downcase }

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :email, presence: true
    validates :email, uniqueness: true

    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
    
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def User.new_token # ランダムなトークンを返す
        SecureRandom.urlsafe_base64
    end

    def remember # 永続セッションのためにユーザーをデータベースに記憶する
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def User.digest(string) # 渡された文字列のハッシュ値を返す
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end
end
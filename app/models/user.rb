class User < ApplicationRecord
  has_secure_password
  has_many :news_posts
end

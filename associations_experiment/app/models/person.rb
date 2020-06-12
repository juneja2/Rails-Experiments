class Person < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  # destroy_all is fine unlike the article
  # destory is fine but something is weird
end
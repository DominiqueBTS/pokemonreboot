class Pokemon < ApplicationRecord
  has_one_attached :photo
  has_many :pokeballs
  has_many :trainers, through: :pokeballs
end

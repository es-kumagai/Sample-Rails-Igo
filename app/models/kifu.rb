class Kifu < ApplicationRecord
	has_many :moves, dependent: :destroy
end

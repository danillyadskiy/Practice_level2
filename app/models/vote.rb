class Vote < ApplicationRecord
	belongs_to :hotel
	belongs_to :user
end

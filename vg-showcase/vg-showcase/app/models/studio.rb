class Studio < ActiveRecord::Base
    has_many :users
    has_many :games, through: :users
    serialize :games
end
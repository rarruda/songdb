class Song < ActiveRecord::Base
	has_many :verses

	validates :title, :presence => true
end

class Song < ActiveRecord::Base
	has_many :verses
	belongs_to :language

	validates :title, :presence => true
end

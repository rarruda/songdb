class Verse < ActiveRecord::Base
	belongs_to :song
	belongs_to :verse_type

	validates :song_id,:verse_type_id,:content, :presence => true
end

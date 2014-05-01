class Song < ActiveRecord::Base
	has_many :verses, -> { order(position: :asc, id: :asc) }, :dependent => :destroy
	belongs_to :language
	belongs_to :songbook

	validates :title, :presence => true
	validates :language_id, :presence => true

	validates :songbook_ref,   length: { maximum: 20, message: "must be under 20 letters" }
	validates :key_signature,  length: { maximum: 5, message: "must be under 5 letters" }
	validates :time_signature, length: { maximum: 5, message: "must be under 5 letters" }
	validates :tempo,          length: { maximum: 5, message: "must be under 5 letters" }

	accepts_nested_attributes_for :verses, :allow_destroy => true
    #:reject_if => lambda { |a| a[:content].blank? },
end

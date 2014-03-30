class Song < ActiveRecord::Base
	has_many :verses, -> { order(position: :asc, id: :asc) }, :dependent => :destroy
	belongs_to :language

	validates :title, :presence => true
	validates :language_id, :presence => true

	accepts_nested_attributes_for :verses, :allow_destroy => true
    #:reject_if => lambda { |a| a[:content].blank? },
end

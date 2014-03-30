class Language < ActiveRecord::Base
	has_many :songs

	validates :name, :presence => true, uniqueness: true
	validates :code, :presence => true, uniqueness: true, format: { with: /\A[a-zA-Z][a-zA-Z]\z/, message: "only 2 letter codes allowed" }
end
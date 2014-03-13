class VerseType < ActiveRecord::Base
	validates :shortcut_key, :presence => true, uniqueness: true, format: { with: /\A[a-z]\z/, message: "only allows letters" }
end

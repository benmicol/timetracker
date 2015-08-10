class Entry < ActiveRecord::Base
	validates :date, presence: true
	validates :time, presence: true
end

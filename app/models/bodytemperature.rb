class Bodytemperature < ApplicationRecord
belongs_to :human
validates :temper, presence:true
validates :human_id, presence:true
validates :temper, numericality:true
validates :human_id, numericality:true
validates :human_id, uniqueness:true



end

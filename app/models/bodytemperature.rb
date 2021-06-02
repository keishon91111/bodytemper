class Bodytemperature < ApplicationRecord
belongs_to :employee
validates :temper, presence:true
validates :employee_id, presence:true
validates :temper, numericality:true
validates :employee_id, numericality:true
# validates :number, uniqueness:true

#  if params[:number].present?
#  @bodytemperatures = Bodytemperature.where('name LIKE ?', "#{params[:number]}")
#  else
#  @bodytemperatures = Bodytemperature.none
#  end

end

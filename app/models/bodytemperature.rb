class Bodytemperature < ApplicationRecord
belongs_to :employee
validates :temper, presence:true
validates :employee_id, presence:true
validates :temper, numericality:true
validates :employee_id, numericality:true
validate :day_validataor  


 validate :day_validataor

    def day_validataor
     
     return false unless new_record?
      if Bodytemperature.where(day:Date.today).where(employee_id:params[:bodytemperature][:employee_id]).all.present?
        errors.add(:bodytemperature.employee.name,"さんは本日、すでに登録しています。")
      end
      
    end
end

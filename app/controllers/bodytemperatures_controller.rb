class BodytemperaturesController < ApplicationController
   def index
    @bodytemperatures = Bodytemperature.where(day:Date.today).order(reason: "DESC")
    # @bodytemperatures = Bodytemperature.all
   end
   
   
   
    
   def new
    @bodytemperature = Bodytemperature.new
   end
   
   def create
     require"date"
    
     @employee =  Employee.find_by(number: params[:bodytemperature][:number])
     @bodytemperature = @employee.bodytemperatures.new(bodytemperatures_params)
     @bodytemperature.day = Date.today
     @bodytemperature.save
     if @bodytemperature.save
     redirect_to new_bodytemperature_path, success:"体温の登録が完了しました。"
     else
     redirect_to new_bodytemperature_path, danger:"登録できませんでした。登録した値を修正してください."
     end
   end
   
   
   
   
   def destroy
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.destroy
     redirect_to bodytemperatures_path, success: "削除が完了しました"
   end
   
    def edit
     @bodytemperature = Bodytemperature.find(params[:id])
        
    end
    

    def update
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.employee.number = params[:bodytemperature][:employee_id]
     @bodytemperature.temper = params[:bodytemperature][:temper]
     @bodytemperature.save
     if @bodytemperature.save
     redirect_to bodytemperatures_path, success: '編集が完了しました'
     else
     redirect_to edit_bodytemperature_path, alart: '編集に失敗しました。入力した値を修正してください。'
     end
    end
   
    # def alert
    
    # end
   
private
    def bodytemperatures_params
        params.require(:bodytemperature).permit(:temper,:item,:reason)
    end
   
end

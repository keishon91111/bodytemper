class BodytemperaturesController < ApplicationController
 def index
    @bodytemperatures = Bodytemperature.where(day:Date.today).order(reason: :desc, temper: :desc)
    # @emeployees = Employee.all.bodytemperatures
    
    # @unsubmitters = Bodytemperature.where(day:Date.today) && Employee.where(day:Date.today)
    @employees_id = Employee.all.map(&:id)
    # binding.pry
    @bodytemperatures.each do |bt|
     @employees_id.delete(bt.employee_id)
    # binding.pry
     end
    #  binding.pry
    @unsubmitters = Employee.where(id:@employees_id)
    # binding.pry
    @employee = Employee.count
    @unsubmit = @unsubmitters.count
    @user = current_user
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
     if (@bodytemperature.save && @bodytemperature.temper <= 36.9 && @bodytemperature.condition == "体調に問題はない" ) 
     redirect_to new_bodytemperature_url, success:"体温の登録が完了しました。本日も１日頑張ってください。"
     elsif (@bodytemperature.save && @bodytemperature.temper <= 36.9 && @bodytemperature.condition == "気分がすぐれない" )
     redirect_to new_bodytemperature_url, success:"体温の登録が完了しました。体調が悪化したら上司に報告しましょう。"
     elsif(@bodytemperature.save && @bodytemperature.temper >=37.0)
     redirect_to  bodytemperatures_danger_url
     else
     redirect_to new_bodytemperature_url, danger:"登録できませんでした。登録した値を修正してください."
     end
  end
  
   
   
   
  def destroy
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.destroy
     redirect_to bodytemperatures_url, success: "削除が完了しました"
  end
  
    def edit
     @bodytemperature = Bodytemperature.find(params[:id])
        
    end
    

    def update
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.temper = params[:bodytemperature][:temper]
     @bodytemperature.condition = params[:bodytemperature][:condition]
     @bodytemperature.reason = params[:bodytemperature][:reason]
     # @bodytemperature.save
     
     if (@bodytemperature.save && @bodytemperature.temper <= 36.9 && @bodytemperature.condition == "体調に問題はない" ) 
     redirect_to bodytemperatures_url, success:"体温のが編集が完了しました。本日も１日頑張ってください。"
     elsif (@bodytemperature.save && @bodytemperature.temper <= 36.9 && @bodytemperature.condition == "気分がすぐれない" )
     redirect_to bodytemperatures_url, success:"体温の編集が完了しました。体調が悪化したら上司に報告しましょう。"
     elsif(@bodytemperature.save && @bodytemperature.temper >=37.0)
     redirect_to  bodytemperatures_url
     # "上長に相談しましょう"
     else
     redirect_to new_bodytemperature_url, danger:"登録できませんでした。登録した値を修正してください."
     end
     
    end
   
    # def alert
    
    # end
    
    def search
       
        @bodytemperatures = Bodytemperature.search(params[:number])
        
    end
   
private
    def bodytemperatures_params
        params.require(:bodytemperature).permit(:temper,:condition,:reason)
    end
   
end
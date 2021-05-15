class BodytemperaturesController < ApplicationController
   def index
    @bodytemperatures = Bodytemperature.all
   end
    
   def new
    # @bodytemperature = Bodytemperature.new
    # @humans = Human.all
   end
   
   def create
     require"date"
     @humans = Human.all
     @bodytemperature.day = Date.today
     @bodytemperature.create(bodytemperatures_params)
     @bodytemperature.save
     if @bodytemperature.save
     redirect_to new_bodytemperature_path, success:"体温の登録が完了しました。"
     else
     # redirect_to new_bodytemperature_path, alart:"登録できませんでした。入力した値を修正してください。"
     redirect_to new_bodytemperature_path, danger:"登録できませんでした。登録した値を修正してください."
     end
   end
   
   def destroy
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.destroy
     redirect_to bodytemperatures_path, notice: "削除が完了しました"
   end
   
    def edit
     @bodytemperature = Bodytemperature.find(params[:id])
        
    end
    

    def update
     @bodytemperature = Bodytemperature.find(params[:id])
     @bodytemperature.human.number = params[:bodytemperature][:human_id]
     @bodytemperature.temper = params[:bodytemperature][:temper]
     @bodytemperature.save
     if @bodytemperature.save
     redirect_to bodytemperatures_path, notice: '編集が完了しました'
     else
     redirect_to edit_bodytemperature_path, alart: '編集に失敗しました。入力した値を修正してください。'
     end
    end
   
    # def alert
    
    # end
   
private
    def bodytemperatures_params
        params.require(:bodytemperature).permit(:day,:temper,:human_id,:item,:reason)
    end
   
end

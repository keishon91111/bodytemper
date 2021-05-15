class HumenController < ApplicationController
protect_from_forgery 

    def new
        @human = Human.new
        # flash[:notice] = '初めに社員番号を登録してください'
        # 社員番号と社員名を登録する画面
    end
    
    def create
        @human = Human.create(humen_params)
        @human.save
        if @human.save
        redirect_to new_bodytemperature_path, success: '社員番号の登録が完了しました。'
        else
        redirect_to new_human_path, danger: '登録できませんでした。入力した値を修正してください'
        # flash[:danger] = '番号の登録に失敗しました。'
        # render :new
        end
        # 新しい社員番号がpostされた際に動作するアクション
    end
    
    
    
    def index
        @human = Human.all
        # 社員番号と社員名の一覧を表示する。
    end
    
    def destroy
         @human = Human.find(params[:id])
         @human.destroy
         redirect_to humen_path, success: "削除が完了しました"
    end
    
    def edit
       @human = Human.find(params[:id]) 
    end
    
    def update
        @human = Human.find(params[:id])
        @human.name = params[:human][:name]
        @human.number = params[:human][:number]
        @human.save
        if @human.save
        redirect_to humen_path, notice: '編集が完了しました'
        else
        flash[:danger] = '編集に失敗しました。入力した値を修正してください。'
        end
end
    
 private
    def humen_params
        params.require(:human).permit(:name,:number)
    end
    
 end
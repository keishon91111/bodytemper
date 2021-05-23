class EmployeesController < ApplicationController
protect_from_forgery 

    def new
        @employee = Employee.new
        # flash[:notice] = '初めに社員番号を登録してください'
        # 社員番号と社員名を登録する画面
    end
    
    def create
        @employee = Employee.create(employees_params)
        if @employee.save
        redirect_to new_bodytemperature_path, success: '社員番号を登録しました.次に体温の登録をしてください'
        else
        redirect_to new_employee_path, danger: '登録できませんでした。入力した値を修正してください'
        # flash[:danger] = '番号の登録に失敗しました。'
        # render :new
        end
        # 新しい社員番号がpostされた際に動作するアクション
    end
    
    
    
    def index
        @employee = Employee.all
        # 社員番号と社員名の一覧を表示する。
    end
    
    def destroy
         @employee = Employee.find(params[:id])
         @employee.destroy
         redirect_to employees_path, success: "削除が完了しました"
    end
    
    def edit
       @employee = Employee.find(params[:id]) 
    end
    
    def update
        @employee = Employee.find(params[:id])
        @employee.name = params[:employee][:name]
        @employee.number = params[:employee][:number]
        @employee.save
        if @employee.save
        redirect_to employees_path, success: '編集が完了しました'
        else
        flash[:danger] = '編集に失敗しました。入力した値を修正してください。'
        end
end
    
 private
    def employees_params
        params.require(:employee).permit(:name,:number)
    end
    
 end
class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user, only: %i[edit update destroy]

  def index
    if params[:sort_expired]
      @tasks =  current_user.tasks.order(due_date: :desc).page(params[:page])
    elsif params[:sort_priority]
      @tasks =  current_user.tasks.order(priority: :desc).page(params[:page])
    elsif
      @tasks =  current_user.tasks.order(created_at: :desc).page(params[:page])
    end
    if params[:search_title].present? && params[:search_status].present?
      @tasks =  current_user.tasks.search_title(params[:search_title]).search_status(params[:search_status]).page(params[:page])
    elsif params[:search_title].present?
      @tasks =  current_user.tasks.search_title(params[:search_title]).page(params[:page])
    elsif params[:search_status].present?
      @tasks =  current_user.tasks.search_status(params[:search_status]).page(params[:page])
    elsif params[:label_id].present?
      @tasks = Task.joins(:labels).where(labels:{id: params[:label_id]}).page(params[:page])
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @task.save
          format.html { redirect_to tasks_path, notice: "タスク作成完了" }
          format.json { render :index, status: :created, location: @task }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "更新完了" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスクを削除しました" }
      format.json { head :no_content }
    end
  end

  def confirm
    @task = current_user.tasks.build(task_params)
    render :new if @task.invalid?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:task, :title, :content, :due_date, :status, :priority, :user, label_ids:[])
  end
end

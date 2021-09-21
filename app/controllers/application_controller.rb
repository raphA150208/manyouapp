class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  private
  def login_required
    redirect_to new_session_path unless current_user
  end

  def authenticate_user
    if logged_in?
      unless current_user.id == @task.user_id
        redirect_to tasks_path, notice:"権限がありません"
      end
    else
      redirect_to new_user_path, notice:"ログインが必要です"
    end
  end
  def ensure_current_user
    if logged_in?
      unless current_user.id == params[:id].to_i
        redirect_to tasks_path, notice:"権限がありません"
      end
    else
      redirect_to new_user_path, notice:"ログインが必要です"
    end
  end
  def logined_not_user_new
    redirect_to tasks_path, notice:"ユーザー新規作成の場合はログアウトしてください" if logged_in?
  end
end


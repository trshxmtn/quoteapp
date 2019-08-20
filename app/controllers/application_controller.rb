class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :picture])
  end

  def search
    @q = Rhetoric.ransack(params[:q])
    @rhetorics = @q.result(distinct: true).page(params[:page]).per(15)
  end

end


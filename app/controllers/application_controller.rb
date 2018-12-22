class ApplicationController < ActionController::Base
  def access_denied(exception)
    # 権限がなくてアクセスできないページはダッシュボードへ飛ばしてメッセージを表示
    if current_user
      redirect_to admin_root_path, alert: I18n.t('active_admin.access_denied.message')
    end
  end
end

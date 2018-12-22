class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # deviseのモジュール
  devise :database_authenticatable, 
         :recoverable, :rememberable
        #  :validatable
  # roleカラムの権限定義
  enum role: [:member, :leader, :manager]
  has_many :reports, dependent: :destroy
end

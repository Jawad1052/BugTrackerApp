class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  belongs_to :role
  #enum role: [:user, :manager, :admin]
  has_many :bugs, dependent: :destroy


  def self.from_google(u)
    user = create_with(uid: u[:uid], provider: 'google',
                       password: Devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
    user.assign_default_role if user.persisted?
    user
  end
  def assign_default_role
    # Find the "developer" role by its ID (assuming ID 4)
    role = Role.find_by(id: 4)
    self.role = role if role.present?
    save
  end
end

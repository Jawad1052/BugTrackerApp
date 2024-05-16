class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google_oauth2]
  belongs_to :role
  #enum role: [:user, :manager, :admin]
  has_many :bugs, dependent: :destroy

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= Role.find_by(name: 'developer') || Role.find(4)
  end
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
  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email id provider remember_created_at reset_password_sent_at role_id uid updated_at]
  end

  # If needed, define ransackable associations as well
  def self.ransackable_associations(auth_object = nil)
    %w[role bugs]
  end
end

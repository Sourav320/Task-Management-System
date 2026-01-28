class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :lockable, :validatable

  has_and_belongs_to_many :roles
  has_many :task_assignments, dependent: :destroy
  has_many :tasks, through: :task_assignments


  validates :email, presence: true, uniqueness: true
  validates :mobile_no, presence: true
  after_create :assign_default_role
  # after_create :skip_email_confirmation


  private

  def assign_default_role
    user_role = Role.find_by(name: "User")
    self.roles << user_role if user_role.present?
  end
  # def skip_email_confirmation
  #   self.confirm 
  # end
end

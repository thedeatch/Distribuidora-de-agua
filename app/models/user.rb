class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 


  Roles = [ :admin , :employee, ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end 

  def fullName
    [first_name, last_name].compact.join(' ')
  end
end

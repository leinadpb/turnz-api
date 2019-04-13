class Zdate < ApplicationRecord
  belongs_to :employee
  belongs_to :user

  def sanitazed_info
    {
        user: user.sanitazed_info,
        employee: employee.sanitazed_info
    }
  end
end

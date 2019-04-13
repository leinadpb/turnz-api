class Employee < ApplicationRecord

  belongs_to :position
  has_many :zdates

  def sanitazed_info
    {
        employee_id: id,
        fullname: fullname,
        position: position.name,
    }
  end

end

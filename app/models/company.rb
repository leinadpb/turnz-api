class Company < ApplicationRecord
  belongs_to :company_type

  def sanitazed_info
    {
        company_id: id,
        name: name,
        location: location,
        address: address,
        email: email,
        company_type: company_type.sanitazed_info
    }
  end
end

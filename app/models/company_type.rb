class CompanyType < ApplicationRecord
  has_many :companies

  def sanitazed_info
    {
        name: name
    }
  end
end

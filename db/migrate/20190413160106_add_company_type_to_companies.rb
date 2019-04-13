class AddCompanyTypeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :company_type, :foreign_key => true
  end
end

class Api::V1::Company::CompaniesController < ApplicationController

  def show
    companies = ::Company.all
    render json: companies.map(&:sanitazed_info), :status => :ok
  end

  def show_by_id
    if params[:id].present?
      company = ::Company.find(params[:id])
      if company.present?
        render json: company.sanitazed_info, :status => :ok
      else
        render json: {
            error: "Company not found with id: #{params[:id]}"
        }
      end
    else
      render json: {
          error: "Please provide and id"
      }, :status => :bad_request
    end
  end

end

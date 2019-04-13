class Api::V1::Employee::EmployeesController < ApplicationController

  def show
    company_id = params[:company_id]
    if company_id.present?
      company = ::Company.find(params[:company_id])
      if company.present?

        employees = ::Employee.where(:company_id => company[:id])
                      .includes(:position)

        render json: employees.map(&:sanitazed_info), :status => :ok

      else
        render json: {
            error: "Company not found with id #{params[:company_id]}"
        }, :status => :not_found
      end
    else
      render json: {
          error: "Please, provide a company id"
      }, :status => :bad_request
    end
  end

  def show_by_id
    employee_id = params[:id]
    if employee_id.present?
      employee = ::Employee.find(params[:id])
      if employee.present?
        zdates = ::Zdate.where(:employee_id => employee[:id])
        render json: {
            employee: employee.sanitazed_info,
            zdates: zdates.map(&:sanitazed_info)
        }
      else
        render json: {
            error: "Employee not found with id = #{params[:id]}"
        }, :status => :not_found
      end
    else
      render json: {
          error: "Please, provide an employee id"
      }, :status => :bad_request
    end
  end

  def add_zdate
    if params[:user_id].present? and params[:employee_id].present?
      user = ::User.find(params[:user_id])
      employee = ::Employee.find(params[:employee_id])
      if user.present? and employee.present?
        zdate = {
            user_id: user[:id],
            employee_id: employee[:id]
        }
        employee.zdates.create!(zdate)

        render json: ::Zdate.find_by(:user_id => zdate[:user_id], :employee_id => zdate[:employee_id]).sanitazed_info, :status => :ok
      else
        render json: {
            error: "User or employee could not be found"
        }, :status => :bad_gateway
      end
    else
      render json: {
          error: "Please provide user and employee id"
      }, :status => :bad_request
    end
  end

  def remove_zdate
    if params[:user_id].present? and params[:employee_id].present?
      user = ::User.find(params[:user_id])
      employee = ::Employee.find(params[:employee_id])
      if user.present? and employee.present?
        zdate = ::Zdate.find_by(:user_id => user[:id], :employee_id => employee[:id])

        if zdate.present?

          zdate.destroy!

          render json: zdate.sanitazed_info, :status => :ok

        else
          render json: {
              error: "No zdate with provided user and employee"
          }, :status => :not_found
        end
      else
        render json: {
            error: "User or employee could not be found"
        }, :status => :bad_gateway
      end
    else
      render json: {
          error: "Please provide user and employee id"
      }, :status => :bad_request
    end
  end

end

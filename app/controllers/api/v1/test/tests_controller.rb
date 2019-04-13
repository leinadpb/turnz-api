class Api::V1::Test::TestsController < ApplicationController

  before_action :authenticate_user!

  def test
    render json: {
        data: 'It works!',
        user: {
            email: current_user.email,
            passeord: current_user.encrypted_password
        }
    }, :status => :ok
  end

end
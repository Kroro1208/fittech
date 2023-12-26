# frozen_string_literal: true

# ApplicationRecord acts as a base class for all models in the application.

class UpController < ApplicationController
  def index
    head :ok
  end

  def databases
    RedisConn.current.ping
    ActiveRecord::Base.connection.execute('SELECT 1')

    head :ok
  end
end

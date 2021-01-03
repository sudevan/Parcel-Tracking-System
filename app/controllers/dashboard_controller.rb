class DashboardController < ApplicationController
  def index  
    @consignments = Consignment.all
  end
end

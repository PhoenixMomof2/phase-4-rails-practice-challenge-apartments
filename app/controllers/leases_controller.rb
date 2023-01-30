class LeasesController < ApplicationController


  def create
    lease = Lease.create(lease_params)
    render :json lease, status: :created
  end

  def destroy
    lease = Lease.find_by_id(params[:id])
    lease.destroy
    render :json {}, status: :deleted
  end

  private
  
  def lease_params
    params.permit(:apartment_id, :tenant_id, :rent)
  end
end

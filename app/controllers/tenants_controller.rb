class TenantsController < ApplicationController

  def index
    tenants = Tenant.all
    render json: tenants
  end

  def show 
    tenant = find_tenant
    if tenant
      render json: tenant
    else
      render json: { error: "tenant not found" }, status: :not_found
    end
  end

  def create 
    tenant = Tenant.create(tenant_params)
    if tenant
      render json: tenant
    else
      render json: { error: "tenant not created" }, status: :unprocessable_entity
    end
  end

  def update 
    tenant = find_tenant
    if tenant
      tenant.update(tenant_params)
      render json: tenant
    else
      render json: { error: "tenant not updated" }, status: :unprocessable_entity
    end
  end

  def destroy 
    tenant = find_tenant
    if tenant
      tenant.destroy
      render json: {}
    else 
      render json: { error: "tenant not found" }, status: :not_found
    end
  end

  private
  def tenant_params
    params.permit(:name, :age)
  end

  def find_tenant
    Tenant.find_by_id(params[:id])
  end
end

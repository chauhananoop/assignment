class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index 
    # binding.pry
    @staffs = Staff.all.order(:id)
    if params[:sort].present?
    @staffs = Staff.all.order(params[:sort]+" "+ params[:direction])
  end
    
    @staffs = @staffs.where("LOWER(username) LIKE :search OR LOWER(name) LIKE :search OR LOWER(email) LIKE :search OR LOWER(address) LIKE :search", search: "%#{params[:search]}%") if params[:search].present?
    
    @staffs = @staffs.page params[:page]
  end

  def show
    @staffs = Staff.all
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:name, :username, :email, :address, :profile, :search, :sort, :direction)
    end
end

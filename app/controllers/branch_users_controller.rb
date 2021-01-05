class BranchUsersController < ApplicationController
  before_action :set_branch_user, only: [:show, :edit, :update, :destroy]

  # GET /branch_users
  # GET /branch_users.json
  def index
    @branch_users = BranchUser.all
  end

  # GET /branch_users/1
  # GET /branch_users/1.json
  def show
  end

  # GET /branch_users/new
  def new
    @branch_user = BranchUser.new
    @users = User.all.map { |p| p.email }
    @servicelocations = ParcelRoute.all.map { |p| p.city_1 }
    @servicelocations = @servicelocations.uniq
  end

  # GET /branch_users/1/edit
  def edit
  end

  # POST /branch_users
  # POST /branch_users.json
  def create
    @branch_user = BranchUser.new(branch_user_params)

    respond_to do |format|
      if @branch_user.save
        format.html { redirect_to @branch_user, notice: 'Branch user was successfully created.' }
        format.json { render :show, status: :created, location: @branch_user }
      else
        format.html { render :new }
        format.json { render json: @branch_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branch_users/1
  # PATCH/PUT /branch_users/1.json
  def update
    respond_to do |format|
      if @branch_user.update(branch_user_params)
        format.html { redirect_to @branch_user, notice: 'Branch user was successfully updated.' }
        format.json { render :show, status: :ok, location: @branch_user }
      else
        format.html { render :edit }
        format.json { render json: @branch_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branch_users/1
  # DELETE /branch_users/1.json
  def destroy
    @branch_user.destroy
    respond_to do |format|
      format.html { redirect_to branch_users_url, notice: 'Branch user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_user
      @branch_user = BranchUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branch_user_params
      params.require(:branch_user).permit(:email, :city)
    end
end

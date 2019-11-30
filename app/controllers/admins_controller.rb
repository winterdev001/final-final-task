class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy,:all_user]

  # GET /admins
  # GET /admins.json
  def index
    # @admins = Admin.all
    users = User.all
    @workers = Worker.all.order('created_at DESC').limit(3)
    @companies = Company.all.order('created_at DESC').limit(3)
    @jobs = Job.all.order('created_at DESC').limit(3)
    @transactions = Transaction.all.order('created_at DESC').limit(3)
  end

  def all_user
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    users = User.all
    @workers = Worker.all
    @companies = Company.all
    @jobs = Job.all
    @transactions = Transaction.all
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:admin, :email)
    end
end

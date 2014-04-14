class UsersController < ApplicationController
  skip_before_filter :authorize

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
      respond_to do |format|
         format.html # index.html.erb
         format.json { render json: @users }
      end

    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.identity = "normal"

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_url, notice: "User #{@user.name} was successfully created."}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_url, notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
    end
  end


  def updateidentity
    if User.find(session[:user_id]).identity == "administrator"
      @user = User.find(params[:id])
      @user.identity = "administrator"
      @user.save
      redirect_to users_url
    end
  end
end

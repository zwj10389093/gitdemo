class DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.json
  def index
    @departments = Department.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @departments }
    end
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department = Department.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @department}
    end
  end

  # GET /departments/new
  # GET /departments/new.json
  def new

    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
      @department = Department.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @department }
      end
    end
  end

  # GET /departments/1/edit
  def edit
    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
      @department = Department.find(params[:id])
    end
  end

  # POST /departments
  # POST /departments.json
  def create
    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
      @department = Department.new(params[:department])

      respond_to do |format|
        if @department.save
          format.html { redirect_to @department, notice: 'Department was successfully created.' }
          format.json { render json: @department, status: :created, location: @department }
        else
          format.html { render action: "new" }
          format.json { render json: @department.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.json
  def update
    @department = Department.find(params[:id])
    @old_bumen = @department.name


    respond_to do |format|
      if @department.update_attributes(params[:department])
        Employee.all.each do |employee|
          if employee.bumen == @old_bumen
            employee.bumen = @department.name
            employee.save
          end
        end

        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    if User.find(session[:user_id]).identity != "administrator"
      redirect_to admin_url
    else
      @department = Department.find(params[:id])
      a = []
      Employee.all.each do |employee|
        if employee.bumen == @department.name
          a.push(employee)
        end
      end

      if a.length() != 0
        respond_to do |format|
          format.html { redirect_to departments_url, notice: 'Still have some employees in this department and fail to delete this department!' }
          format.json { head :no_content }
        end
      else

        @department.destroy

        respond_to do |format|
          format.html { redirect_to departments_url }
          format.json { head :no_content }
        end
      end
    end
  end
end

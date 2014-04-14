require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
    @update = {
      age: 25,
      birth: '1989/02/02', 
      department: 'IT', 
      eid: '63906', 
      intodepartmentdate: '2006/02/02', 
      marriage: '已婚', 
      name: '路人甲', 
      nation: '汉族', 
      pay: 6000, 
      remark: '很有意思', 
      sex: '男', 
      workdate: '2005/01/01'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: @update 
  end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: @update
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end

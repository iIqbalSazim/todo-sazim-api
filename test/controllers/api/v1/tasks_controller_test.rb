require "test_helper"

class Api::V1::TasksControllerTest < ActionController::TestCase
  test "#index responds with success" do
    tasks = [Task.new(description: 'Task 1', priority: 1, is_completed: false, is_deleted: false), 
             Task.new(description: 'Task 2', priority: 2, is_completed: true, is_deleted: false)]

    interactor_result = mock
    interactor_result.expects(:success?).returns(true)
    interactor_result.expects(:tasks).returns(tasks)

    Tasks::Index.expects(:call).returns(interactor_result)

    get :index

    response_body = JSON.parse(response.body)

    assert_response :ok
    assert_equal tasks.length, response_body.length
  end

  test "#index does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false)

    Tasks::Index.expects(:call).returns(interactor_result)

    get :index

    assert_response :not_found 
  end

  test "#create responds with success" do
    new_task = Task.new(description: 'Task 1', priority: 1, is_completed: false, is_deleted: false)

    interactor_result = mock
    interactor_result.expects(:success?).returns(true)
    interactor_result.expects(:task_data).returns(new_task)

    Tasks::CreateTask.expects(:call).returns(interactor_result)

    post :create, params: { task: { description: 'Task 1', priority: 1, is_completed: false, is_deleted: false } }

    expected_response = {
      "id" => new_task.id,
      "description" => new_task.description,
      "priority" => new_task.priority,
      "created_at" => new_task.created_at,
      "due_date" => new_task.due_date,
      "is_completed" => new_task.is_completed,
      "is_deleted" => new_task.is_deleted
    }

    response_body = JSON.parse(response.body)

    assert_response :created
    assert_equal expected_response, response_body
  end

  test "#create does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false)

    Tasks::CreateTask.expects(:call).returns(interactor_result)

    post :create, params: { task: { description: 'Task 1', priority: 1, is_completed: false, is_deleted: false } }

    assert_response :unprocessable_entity 
  end

  test "#update responds with success" do
    mock_updated_task = Task.new(id: 1, description: 'Updated Task 1', priority: 1, is_completed: false, is_deleted: false)

    interactor_result = mock
    interactor_result.expects(:success?).returns(true)
    interactor_result.expects(:task_data).returns(mock_updated_task)

    Tasks::UpdateTaskFlow.expects(:call).returns(interactor_result)

    patch :update, params: { id: 1, task: { description: 'Updated Task 1', priority: 1, is_completed: false, is_deleted: false } }

    expected_response = {
      "id" => mock_updated_task.id,
      "description" => mock_updated_task.description,
      "priority" => mock_updated_task.priority,
      "created_at" => mock_updated_task.created_at,
      "due_date" => mock_updated_task.due_date,
      "is_completed" => mock_updated_task.is_completed,
      "is_deleted" => mock_updated_task.is_deleted
    }

    response_body = JSON.parse(response.body)

    assert_response :ok
    assert_equal expected_response, response_body
  end

  test "#update does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false)

    Tasks::UpdateTaskFlow.expects(:call).returns(interactor_result)

    patch :update, params: { id: 1, task: { description: 'Updated Task 1', priority: 1, is_completed: false, is_deleted: false } }

    assert_response :unprocessable_entity 
  end

  test "#destroy_all responds with success when params is_completed" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(true) 

    Tasks::DestroyAllTasksFlow.expects(:call).returns(interactor_result)

    post :destroy_all, params: { task: { is_completed: true } }

    assert_response :ok
  end

  test "#destroy_all responds with success when params is_deleted" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(true) 

    Tasks::DestroyAllTasksFlow.expects(:call).returns(interactor_result)

    post :destroy_all, params: { task: { is_deleted: true } }

    assert_response :ok
  end

  test "#destroy_all does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false)

    Tasks::DestroyAllTasksFlow.expects(:call).returns(interactor_result)

    post :destroy_all, params: { task: { is_completed: true } }

    assert_response :unprocessable_entity 
  end

  test "#archive_task responds with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(true) 

    Tasks::ArchiveTaskFlow.expects(:call).returns(interactor_result)

    put :archive_task, params: { id: 1 }

    assert_response :ok
  end

  test "#archive_task does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false) 

    Tasks::ArchiveTaskFlow.expects(:call).returns(interactor_result)

    put :archive_task, params: { id: 1 }

    assert_response :unprocessable_entity
  end

  test "#retrieve_archived responds with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(true) 

    Tasks::RetrieveArchivedTasksFlow.expects(:call).with(task_params: { is_deleted: true }).returns(interactor_result)

    put :retrieve_archived

    assert_response :ok
  end

  test "#retrieve_archived does not respond with success" do
    interactor_result = mock
    interactor_result.expects(:success?).returns(false) 

    Tasks::RetrieveArchivedTasksFlow.expects(:call).with(task_params: { is_deleted: true }).returns(interactor_result)

    put :retrieve_archived

    assert_response :unprocessable_entity
  end
end

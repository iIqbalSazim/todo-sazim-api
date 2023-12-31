class Api::V1::TasksController < ApplicationController
  include Panko

  def index
    result = Tasks::Index.call

    if result.success?
      serialized_tasks = ArraySerializer.new(result.tasks, each_serializer: TaskSerializer).to_json
      render json: serialized_tasks
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def create
    result = Tasks::CreateTask.call(task_params: task_params)

    if result.success?
      serialized_task = TaskSerializer.new.serialize_to_json(result.task_data)
      render json: serialized_task, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def update
    result = Tasks::UpdateTaskFlow.call(id: params[:id], task_params: task_params) 

    if result.success?
      serialized_task = TaskSerializer.new.serialize_to_json(result.task_data)
      render json: serialized_task
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def destroy_all
    if params[:type] == "completed"
      result = Tasks::DestroyAllTasksFlow.call(task_params: { is_completed: true }, type: params[:type])
    else
      result = Tasks::DestroyAllTasksFlow.call(task_params: { is_deleted: true }, type: params[:type])
    end

    if result.success? 
      render json: { success: true }
    elsif result.fail?
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def archive_task
    result = Tasks::ArchiveTaskFlow.call(id: params[:id])

    if result.success? 
      render json: { success: true }
    elsif result.fail?
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def retrieve_archived
    result = Tasks::RetrieveArchivedTasksFlow.call(task_params: { is_deleted: true })

    if result.success? 
      render json: { success: true }
    elsif result.fail?
      render json: result.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:description, :priority, :due_date, :is_completed, :is_deleted)
  end
end

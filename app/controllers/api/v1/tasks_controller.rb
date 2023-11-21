class Api::V1::TasksController < ApplicationController

  def index
    @tasks = Task.all

    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    result = Tasks::CreateTaskInteractor.call(task_params: task_params)

    if result.success?
      render json: result.task_data, status: :created
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def update
    result = UpdateTaskOrganizer.call(id: params[:id], task_params: task_params) 

    if result.success?
      render json: result.task_data
    else
      render json: result.errors, status: :unprocessable_entity
    end
  end

  def destroy_all
    Tasks::DestroyAllTasksInteractor.call(type: params[:type])
  end

  def archive_task
    ArchiveTaskOrganizer.call(id: params[:id])
  end

  def retrieve_archived
    Tasks::RetrieveArchivedTasksInteractor.call
  end

  private

  def task_params
    params.require(:task).permit(:description, :priority, :due_date, :is_completed, :is_deleted)
  end
end

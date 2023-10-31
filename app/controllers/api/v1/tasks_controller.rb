class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy archive_task ]

  def index
    @tasks = Task.all

    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!
  end

  def destroy_all
    if params[:type] == "completed"
      completed_tasks = Task.where(is_completed: true)
      Task.destroy(completed_tasks.ids)
    elsif params[:type] == "archived"
      archived_tasks = Task.where(is_deleted: true)
      Task.destroy(archived_tasks.ids)
    end
  end

  def archive_task
    @task.update(is_deleted: true)
  end

  def retrieve_archived
    archived_tasks = Task.where(is_deleted: true)
    archived_tasks.update_all(is_deleted: false)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :priority, :due_date, :is_completed, :is_deleted)
    end
end

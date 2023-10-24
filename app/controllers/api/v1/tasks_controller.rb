class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy archive_task ]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  # DELETE /completed
  def destroy_completed
    completed_tasks = Task.where(is_completed: true)
    Task.destroy(completed_tasks.ids)
  end

  # DELETE /archived
  def destroy_archived
    archived_tasks = Task.where(is_deleted: true)
    Task.destroy(archived_tasks.ids)
  end

  # PATCH /archived/1
  def archive_task
    @task.update(is_deleted: true)
  end

  # PATCH /archived
  def retrieve_archived
    archived_tasks = Task.where(is_deleted: true)
    archived_tasks.update_all(is_deleted: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:description, :priority, :due_date, :is_completed, :is_deleted)
    end
end

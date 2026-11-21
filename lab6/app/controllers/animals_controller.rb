class AnimalsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_animal, only: %i[ show edit update destroy ]
  before_action :authorize_owner_or_admin!, only: %i[ edit update destroy ]
  before_action :authorize_admin!, only: :destroy_all

  def index
    @animals = Animal.includes(:user).with_attached_image.all
  end

  def show
  end

  def new
    @animal = Animal.new(status: Animal::STATUSES.first)
  end

  def edit
  end

  def create
    @animal = current_user.animals.build(animal_params)

    respond_to do |format|
      if @animal.save
        format.html { redirect_to @animal, notice: "Тварину додано." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @animal.errors, status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: "Запис оновлено.", status: :see_other }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @animal.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @animal.destroy!

    respond_to do |format|
      format.html { redirect_to animals_path, notice: "Запис видалено.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def destroy_all
    Animal.destroy_all
    redirect_to animals_path, notice: "Усі записи видалено.", status: :see_other
  end

  private
    def set_animal
      @animal = Animal.find(params.expect(:id))
    end

    def animal_params
      params.expect(animal: [ :name, :species, :age, :status, :description, :image ])
    end

    def authorize_owner_or_admin!
      unless current_user.admin? || @animal.user == current_user
        redirect_to animals_path, alert: "У вас немає прав для редагування або видалення цього запису."
      end
    end

    def authorize_admin!
      unless current_user.admin?
        redirect_to animals_path, alert: "Тільки адміністратор може видалити всі записи."
      end
    end
end

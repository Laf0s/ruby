class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy ]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new(status: Animal::STATUSES.first)
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)

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
      params.expect(animal: [ :name, :species, :age, :status, :description ])
    end
end

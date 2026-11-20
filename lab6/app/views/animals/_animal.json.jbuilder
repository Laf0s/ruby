json.extract! animal, :id, :name, :species, :age, :status, :description, :created_at, :updated_at
json.url animal_url(animal, format: :json)

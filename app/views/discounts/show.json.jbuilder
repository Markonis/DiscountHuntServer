json.extract! @discount, :id, :title, :description, :category, :votes, :price, :created_at, :updated_at
json.user @discount.user, :photo, :first_name, :last_name
json.photo @discount.photo
json.location @discount.location

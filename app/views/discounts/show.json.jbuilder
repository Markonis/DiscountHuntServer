json.extract! @discount, :id, :title, :description, :category, :price
json.user @discount.user, :photo, :first_name, :last_name
json.photo @discount.photo
json.location @discount.location
json.votes @discount.votes
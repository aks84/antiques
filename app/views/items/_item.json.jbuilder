json.extract! item, :id, :name, :images, :description, :starting_price, :current_bid, :end_time, :created_at, :updated_at
json.url item_url(item, format: :json)
json.images do
  json.array!(item.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end

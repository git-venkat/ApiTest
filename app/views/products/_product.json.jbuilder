json.extract! product, :id, :title, :price, :released_on, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
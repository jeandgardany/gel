json.extract! product, :id, :code, :name, :category_id, :description, :provider, :created_at, :updated_at
json.url product_url(product, format: :json)

json.extract! consignment, :id, :user_id, :destination_pin, :source_pin, :status, :weight, :tracking_id, :source_contact, :destination_contact, :created_at, :updated_at
json.url consignment_url(consignment, format: :json)

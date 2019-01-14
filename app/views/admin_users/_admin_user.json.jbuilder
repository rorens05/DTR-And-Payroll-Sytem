json.extract! admin_user, :id, :email, :password_digest, :name, :contact_no, :created_at, :updated_at
json.url admin_user_url(admin_user, format: :json)

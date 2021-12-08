json.extract! profile, :id, :user_id, :first_name, :last_name, :gender, :age,
              :occupation, :current_city, :pet_owner, :pet_description, :about_me, :created_at, :updated_at
json.url profile_url(profile, format: :json)

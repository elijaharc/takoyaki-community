FactoryBot.define do
    factory :user do
      id { 1 }
      first_name { 'Elijah' }
      last_name { 'Arc' }
      email { 'admin@admin.com' }
      password { 'password' }
      region { 'Metro Manila' }
      city { 'Quezon City' }
    end
  end
  
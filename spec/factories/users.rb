FactoryBot.define do
  factory :user do
    name { 'Suzuki Masaru' }
    email { 'meiyuu@example.com' }
    password { '2626allG' }
    password_confirmation { '2626allG' }
  end

  factory :other_user do
    name { 'Suzuki Taro' }
    email { 'taro@example.com' }
    password { '2625allG' }
    password_confirmation { '' }
  end
end

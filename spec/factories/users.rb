FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "g9#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    role_id               {2}
  end
end

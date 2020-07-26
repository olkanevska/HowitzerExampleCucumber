FactoryBot.define do
  factory :user do
    email { "u#{Gen.serial}@#{Howitzer.mailgun_domain}" }
    name { Howitzer.app_test_user }
    password { Howitzer.app_test_pass }
    password_confirmation { Howitzer.app_test_pass }

    trait :default do
      initialize_with { User.default || User.new }
    end
  end
end

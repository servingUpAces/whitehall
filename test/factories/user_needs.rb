FactoryGirl.define do
  factory :user_need do
    user "Example User"
    need "Example Need"
    goal "Example Goal"
    organisation { build(:organisation) }
  end
end

FactoryGirl.define do
  factory :photo do
    sequence(:filename) {|n| "photo_#{n}" }
  end
end


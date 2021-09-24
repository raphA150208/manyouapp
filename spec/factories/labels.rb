FactoryBot.define do
  factory :label do
    sequence(:name) { |n| "ラベル#{n}"}
  end
end
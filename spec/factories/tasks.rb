FactoryBot.define do
  factory :task do
    title { 'test_title1' }
    content { 'test_content1' }
    due_date { '2021-10-11 00:00:00' }
    status {'未着手'}
    priority {'低'}
    association :user, user: :general_user
    after(:create) do |task|
      create_list(:labeling, 1, task: task, label: create(:label))
    end
  end
  factory :second_task, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
    due_date {'2021-10-21 00:00:00'}
    status {'進行中'}
    priority {'低'}
    association :user, user: :general_user
    after(:create) do |second_task|
      create_list(:labeling, 1, task: second_task, label: create(:label))
    end
  end
end
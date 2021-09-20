FactoryBot.define do
  factory :task do
    title { 'test_title1' }
    content { 'test_content1' }
    due_date { '2021-10-11 00:00:00' }
    status {'未着手'}
    priority {'低'}
  end
  factory :second_task, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
    due_date {'2021-10-21 00:00:00'}
    status {'進行中'}
    priority {'高'}
  end
end
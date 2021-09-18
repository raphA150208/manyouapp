FactoryBot.define do
  factory :task do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    title { 'test_title1' }
    content { 'test_content1' }
  end
  factory :second_task, class: Task do
    title { 'test_title2' }
    content { 'test_content2' }
  end
end
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'タスクモデル機能', type: :model do
    describe 'バリデーションのテスト' do
      context 'タスクのタイトルが空の場合' do
        it 'バリデーションにひっかる' do
          task = Task.new(title: '', content: 'テスト失敗です', due_date: '2021-09-30 00:00:00', status: '進行中', priority: '中')
          expect(task).not_to be_valid
        end
      end
      context 'タスクの詳細が空の場合' do
        it 'バリデーションにひっかかる' do
          # ここに内容を記載する
          task = Task.new(title: 'テスト失敗しました', content: '')
          expect(task).not_to be_valid
        end
      end
      context 'タスクのタイトルと詳細に内容が記載されている場合' do
        it 'バリデーションが通る' do
          task = Task.new(title: 'テスト成功です', content: 'テスト成功', due_date: '2021-10-01 00:00:00')
          expect(task).to be_valid
        end
      end
    end
    describe '検索機能' do
      let!(:general_user) { FactoryBot.create(:general_user) }
      let!(:task) { FactoryBot.create(:task, title: 'task_test', due_date: '2021-09-30 00:00:00', status: '完了', priority: '中', user:general_user) }
      let!(:second_task) { FactoryBot.create(:second_task, title: 'sample', due_date: '2021-09-30 00:00:00', status: '進行中', priority: '中', user:general_user) }
      context 'scopeメソッドでタイトルのあいまい検索をした場合' do
        it "検索キーワードを含むタスクが絞り込まれる" do
          expect(Task.search_title('task_te')).to include(task)
          expect(Task.search_title('task_te')).not_to include(second_task)
          expect(Task.search_title('task_te').count).to eq 1
        end
      end
      context 'scopeメソッドでステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          expect(Task.search_status('完了')).to include(task)
          expect(Task.search_status('完了').count).to eq 1
        end
      end
      context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          expect(Task.search_title('task_te')).to include(task)
          expect(Task.search_title('task_te')).not_to include(second_task)
          expect(Task.search_title('task_te').count).to eq 1
          expect(Task.search_status('完了')).to include(task)
          expect(Task.search_status('完了').count).to eq 1
        end
      end
    end
  end
end



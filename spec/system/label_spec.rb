require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  let!(:label) { FactoryBot.create(:label) }
  let!(:general_user) { FactoryBot.create(:general_user) }
  let!(:task) { FactoryBot.create(:task, user:general_user) }
  let!(:second_task) { FactoryBot.create(:second_task, user: general_user) }
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'general_email@email.com'
    fill_in 'session[password]', with:'generaluser'
    click_button 'ログイン'
    visit new_task_path
    fill_in 'task[title]', with: 'test_title'
    fill_in 'task[content]', with: 'test_content'
    fill_in 'task[due_date]', with: '2021-10-13 00:00:00'.to_date
    select '進行中', from: 'task[status]'
    select '中', from: 'task[priority]'
    check "task_label_ids_#{label.id}"
    click_button '作成'
    click_button '作成'
  end
  describe '新規作成機能' do
    context 'タスク作成したとき' do
      it 'ラベルがタスクと一緒に登録される' do
        expect(page).to have_content 'ラベル1'
        # binding.pry
      end
    end
  end
  describe '詳細表示機能' do
    context 'タスク詳細画面に遷移した場合' do
      it 'タスクにつけたラベルの内容が表示される' do
        all('.index_list')[0].click_button '詳細'
        expect(page).to have_content 'ラベル4'
      end
    end
  end
  describe '検索機能' do
    context 'ラベル検索をした場合' do
      it "検索したラベルがついているタスクが絞り込まれる" do
        # binding.pry

        select 'ラベル7', from: 'label_id'
        click_button '検索'
        expect(page).to have_content 'ラベル7'
      end
    end
  end
end
class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20}
  validates :due_date, presence: true
  validates :status, presence: true
  enum status: {未着手:0, 進行中:1, 完了:2}
end

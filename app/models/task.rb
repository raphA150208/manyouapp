class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20}
  validates :due_date, presence: true
  validates :status, presence: true
  enum status: {未着手:0, 進行中:1, 完了:2}
  enum priority: {低:0, 中:1, 高:2}
  scope :search_title, -> (title) { where("title LIKE ?", "%#{title}%") }
  scope :search_status, -> (status) { where(status: status)}
  belongs_to :user, optional: true
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings
end

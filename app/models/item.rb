class Item < ApplicationRecord
  belongs_to :user
  #has_one :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :status
  has_one_attached :image

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :name
      validates :info
    end
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :area_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end
end

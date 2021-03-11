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

    validates :name
    validates :info
    validates_inclusion_of :price, in: 300..9_999_999
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :area_id
    validates :delivery_day_id
    validates :delivery_fee_id
  end
end

class StickerSerializer < ActiveModel::Serializer
  attribute :uuid, key: :id
  attributes :uuid, :number, :quantity
  has_one :collection
end

# frozen_string_literal: true

class StickerSerializer < ActiveModel::Serializer
  attribute :uuid, key: :id
  attributes :number, :quantity, :status, :number_of_repeated
  has_one :collection
end

class SearchParams
  include ActiveModel::Model

  attr_accessor :language_id, :radius, :address
end
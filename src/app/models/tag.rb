class Tag < ContentfulModel::Base
  self.content_type_id = "tag"

  has_many :recipes

  coerce_field name: :String
end

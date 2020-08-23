class Chef < ContentfulModel::Base
  self.content_type_id = "chef"

  has_many :recipes

  coerce_field name: :String
end

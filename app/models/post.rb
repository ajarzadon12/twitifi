class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  belongs_to :user
end

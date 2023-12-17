class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent, class_name: 'Comment', foreign_key: 'parent_id', optional: true
  has_many :children, class_name: "Comment", foreign_key: 'parent_id'
end
class Follower < ApplicationRecord
    belongs_to :publisher, foreign_key: :publisher_id, class_name: 'User'
    belongs_to :subscriber, foreign_key: :subscriber_id, class_name: 'User'
    validate :check_self
    def check_self
        if publisher==subscriber
            errors.add :subscriber, :following_self, message:"Нельзя быть подписанным на себя"
        end
    end
end
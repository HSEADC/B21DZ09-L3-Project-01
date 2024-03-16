class Subscription < ApplicationRecord
    validates :name, :telegram, :site, presence: true
end

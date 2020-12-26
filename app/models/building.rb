class Building < ApplicationRecord
    has_many :favorites, class_name: "favorite", foreign_key: "favorite_id"
end

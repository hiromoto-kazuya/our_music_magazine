class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :search_with_user, -> {where("name like '%" + $searching_word + "%'")
                              .or(where("introduce_message like '%" + $searching_word + "%'")) }
end

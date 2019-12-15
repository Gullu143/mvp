class Article < ApplicationRecord
	 has_one_attached :image
	 belongs_to :seller
	 has_many :comments

	 enum status: { publish:0, draft: 1  }

	 include PgSearch::Model
  	 pg_search_scope :search, against: [:title, :description]
end

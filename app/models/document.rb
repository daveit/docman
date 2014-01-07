class Document < ActiveRecord::Base
  belongs_to :location
  belongs_to :product
  mount_uploader :docname, DocnameUploader

  validates :docname, :docdate, presence: true  
  validates_associated :location
  validates_associated :product
  
  include PgSearch
  pg_search_scope :search, against: [:docname, :deldoc, :lotnum, :custord, :salesorder, :docdate],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {location: :name, product: [:name, :code]}

  def self.text_search(query)
    if query.present?
      search(query)
      # where("docname @@ :q or deldoc @@ :q or lotnum @@ :q or custord @@ :q or salesorder @@ :q", q: query)
    else
      scoped
    end
  end

end

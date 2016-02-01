class Type < ActiveRecord::Base
  has_many :users
  has_many :restaurants

  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end

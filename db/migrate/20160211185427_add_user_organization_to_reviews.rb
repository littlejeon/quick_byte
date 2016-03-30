class AddUserOrganizationToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :user_organization, index: true, foreign_key: true
  end
end

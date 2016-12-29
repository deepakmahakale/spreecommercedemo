class CreateSpreeMemberships < ActiveRecord::Migration
  def change
    create_table :spree_memberships do |t|
      t.string :name
    end
  end
end

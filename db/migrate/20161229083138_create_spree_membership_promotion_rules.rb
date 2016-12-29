class CreateSpreeMembershipPromotionRules < ActiveRecord::Migration
  def change
    create_table :spree_membership_promotion_rules do |t|
      t.references :membership, index: true, foreign_key: true
      t.references :promotion_rule, index: true, foreign_key: true
    end
  end
end

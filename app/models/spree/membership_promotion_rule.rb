module Spree
  class MembershipPromotionRule < Spree::Base
    belongs_to :membership, class_name: 'Spree::Membership'
    belongs_to :promotion_rule, class_name: 'Spree::PromotionRule'

    validates :membership, :promotion_rule, presence: true
    validates :membership_id, uniqueness: { scope: :promotion_rule_id },
                              allow_nil: true
  end
end

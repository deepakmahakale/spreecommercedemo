module Spree
  class Membership < Spree::Base
    validates :name, presence: true

    has_many :membership_promotion_rules,
             class_name: 'Spree::MembershipPromotionRule'

    has_many :promotion_rules, through: :membership_promotion_rules,
                               class_name: 'Spree::PromotionRule'

    has_many :promotions, through: :promotion_rules,
                          class_name: 'Spree::Promotion'
  end
end

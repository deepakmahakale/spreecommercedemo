module Spree
  class Promotion
    module Rules
      class Membership < Spree::PromotionRule
        has_many :membership_promotion_rules,
                 class_name: 'Spree::MembershipPromotionRule',
                 foreign_key: :promotion_rule_id
        has_many :memberships, through: :membership_promotion_rules,
                               class_name: 'Spree::Membership'

        MATCH_POLICIES = %w(any all none).freeze
        preference :match_policy, :string, default: MATCH_POLICIES.first

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          # debugger
          # ...
        end

        def actionable?(line_item)
          # ...
        end

        def membership_ids_string
          membership_ids.join(',')
        end

        def membership_ids_string=(s)
          self.membership_ids = s.to_s.split(',').map(&:strip)
        end
      end
    end
  end
end

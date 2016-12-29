Spree::PromotionHandler::Coupon.class_eval do
  def apply
    debugger
    if order.coupon_code.present?
      if promotion.present? && promotion.actions.exists?
        handle_present_promotion(promotion)
      else
        if Spree::Promotion.with_coupon_code(order.coupon_code).try(:expired?)
          set_error_code :coupon_code_expired
        else
          set_error_code :coupon_code_not_found
        end
      end
    end

    self
  end
end

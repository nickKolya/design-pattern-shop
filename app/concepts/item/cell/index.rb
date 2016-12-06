class Item
  class Cell
    class Index < ::Cell::Concept
      inherit_views ::Item::Cell

      delegate :new_item, to: 'Rails.application.routes.url_helpers'

      def show
        render :index
      end

      def new_product_link
        link_to I18n.t('views.product.new_product'), new_product_path,
                class: 'btn btn-primary' if user_policy.admin?
      end

      def new_service_link
        link_to I18n.t('views.product.new_service'), new_service_path,
                class: 'btn btn-primary' if user_policy.admin?
      end

      def user_policy
        @user_policy ||= UserPolicy.new(params[:current_user])
      end
    end
  end
end

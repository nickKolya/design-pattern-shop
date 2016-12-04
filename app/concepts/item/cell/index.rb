class Item
  class Cell
    class Index < ::Cell::Concept
      inherit_views ::Item::Cell

      delegate :new_item, to: 'Rails.application.routes.url_helpers'

      def show
        render :index
      end

      def new_item_link
        link_to I18n.t('views.product.new_product'), new_item_path, class: 'btn btn-primary' if
          user_policy.admin?
      end

      def user_policy
        @user_policy ||= UserPolicy.new(@params[:current_user])
      end
    end
  end
end

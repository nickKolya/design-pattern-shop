class Service
  class Cell
    class New < ::Cell::Concept
      inherit_views Service::Cell

      include ActionView::Helpers::FormOptionsHelper

      def show
        @form = options[:form]
        render :new
      end
    end
  end
end

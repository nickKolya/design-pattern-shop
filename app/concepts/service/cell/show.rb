class Service
  class Cell
    class Show < ::Cell::Concept
      inherit_views Service::Cell

      delegate :price, :category_name, :name, :image, :description,
               :launch_date, :location, to: :model

      def show
        render :show
      end

      private

      def location_field
        wrapper_option_field do
          marker_icon + location
        end if location
      end

      def launch_date_field
        wrapper_option_field do
          calendar_icon + launch_date
        end if launch_date
      end

      def wrapper_option_field
        content_tag(:div, yield, class: 'm-t-xs text-icon text-muted')
      end

      def calendar_icon
        content_tag(:i, nil, class: 'fa fa-calendar')
      end

      def marker_icon
        content_tag(:i, nil, class: 'fa fa-map-marker')
      end
    end
  end
end

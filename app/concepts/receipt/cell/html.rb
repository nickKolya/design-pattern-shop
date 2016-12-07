module Receipt
  class Cell
    class Html < ::Cell::Concept
      inherit_views ::Receipt::Cell
      include Configs::Css
      attr_reader :logo_path

      DEFAULT_LOGO_PATH = 'logo.png'.freeze

      def initialize(args = {})
        binding.pry
        @logo_path = args[:logo_path] || DEFAULT_LOGO_PATH
      end

      def header
        content_tag(:header, style: 'text-align: center;') do
          (I18n.t('receipt.corporation') +
            tag(:br, nil) +
            I18n.t('receipt.address') +
            tag(:br) +
            image_tag(logo_path, style: 'width: 50px;') +
            tag(:br) +
            billing_id +
            dashed_line).html_safe
        end
      end

      def body
        content_tag :body do
          product_list + dashed_line
        end
      end

      def footer
        content_tag :footer, style: 'font-size: 15px;' do
          sum + total
        end
      end

      def wrapper
        content_tag :div, style: receipt_wrapper do
          yield
        end
      end

      private

      def dashed_line
        content_tag(:div, nil, style: line_dashed)
      end

      def product_list
        content_tag(:table, style: table) do
          content_tag(:tbody) do
            content_tag(:tr) do
              product_name + product_price
            end
            content_tag(:tr) do
              product_name + product_price
            end
            content_tag(:tr) do
              product_name + product_price
            end
            content_tag(:tr) do
              product_name + product_price
            end
          end
        end
      end

      def sum
        content_tag :div, style: sum_style do
          content_tag(:span, 'SUM')
        end
      end

      def total
        content_tag :div, style: total_style do
          content_tag(:span, '100')
        end
      end

      def product_name#(product)
        content_tag :td, 'Product', style: 'width: 70%;'
      end

      def product_price#(product)
        content_tag :td, style: 'float: right;' do
          ('1 x 50' +
            tag(:br) +
            tag(:br) +
            '50').html_safe
        end
      end

      def billing_id
        'BI 54236745626345'
      end
    end
  end
end

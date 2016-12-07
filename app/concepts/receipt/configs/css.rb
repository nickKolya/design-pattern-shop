module Receipt
  module Configs
    module Css
      def receipt_wrapper
        "background-color: #fff;\
         padding: 25px;\
         width: 375px;\
         border-radius: 5px;\
         border: 1px solid #e7eaec;\
         font-size: 11px;\
         font-family: \"open sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\
         color: #676a6c;"
      end

      def line_dashed
        "border-top: 1px dashed #e7eaec;\
         color: #ffffff;\
         background-color: #ffffff;\
         height: 1px;\
         margin: 10px -10px;\
         color: #676a6c;"
      end

      def table
        'width: 100%; font-size: 12px;'
      end

      def sum_style
        'font-weight: bold; display: inline-block; width: 80%;'
      end

      def total_style
        'float: right; display: inline-block;'
      end
    end
  end
end

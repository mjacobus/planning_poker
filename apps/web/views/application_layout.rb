module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def layout_method
        'i am a layout method'
      end
    end
  end
end

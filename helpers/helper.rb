class Helper
  # module HTMLEscapeHelper
  #   def h(text)
  #     Rack::Utils.escape_html(text)
  #   end
  # end

  module Support
    def parameterize text, separator = '-'
      text.gsub(/[^a-z0-9\-_]+/, separator)
    end
  end
end

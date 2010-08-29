module TextFormatter
  require 'sanitize'
  require 'kramdown'

  module Formatters
    MARKDOWN = 1
    TEXTILE = 2
  end

  RELAXED = {
    :elements => [
      'a', 'b', 'blockquote', 'br', 'caption', 'cite', 'code', 'col',
      'colgroup', 'dd', 'dl', 'dt', 'em', 'i', 'img', 'li', 'ol', 'p', 'pre',
      'q', 'small', 'strike', 'strong', 'sub', 'sup', 'table', 'tbody', 'td',
      'tfoot', 'th', 'thead', 'tr', 'u', 'ul', 'del', 'ins', 'h1', 'h2', 'h3', 'h4', 'h5', 'h5', 'hr', 'kbd'],

    :attributes => {
      'a'          => ['href', 'title'],
      'blockquote' => ['cite'],
      'col'        => ['span', 'width'],
      'colgroup'   => ['span', 'width'],
      'img'        => ['align', 'alt', 'height', 'src', 'title', 'width'],
      'ol'         => ['start', 'type'],
      'q'          => ['cite'],
      'table'      => ['summary', 'width'],
      'td'         => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
      'th'         => ['abbr', 'axis', 'colspan', 'rowspan', 'scope',
        'width'],
      'ul'         => ['type']
    },

    :protocols => {
      'a'          => {'href' => ['ftp', 'http', 'https', 'mailto',
          :relative]},
      'blockquote' => {'cite' => ['http', 'https', :relative]},
      'img'        => {'src'  => ['http', 'https', :relative]},
      'q'          => {'cite' => ['http', 'https', :relative]}
    }
  }



  def self.to_html(text, formatter = Formatters::MARKDOWN)
    return "" unless text

    html = case formatter
    when Formatters::MARKDOWN then
      Kramdown::Document.new(text).to_html
      #RDiscount.new(text, :smart).to_html
    when Formatters::TEXTILE then
      RedCloth.new(text).to_html
    end

    Sanitize.clean(html, RELAXED)
  end
end

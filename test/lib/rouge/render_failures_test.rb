require 'minitest/autorun'
require 'rouge'

class RougeTest < Minitest::Test
  def test_coq
     source = %q(Definition hello:string := "Hello, World!".)
     formatter = Rouge::Formatters::HTML.new
     lexer = Rouge::Lexers::Coq.new
     expected = %q(<span class="k">Definition</span><span class="w"> </span><span class="no">hello</span><span class="p">:</span><span class="no">string</span><span class="w"> </span><span class="p">:=</span><span class="w"> </span><span class="s2">"Hello, World!"</span><span class="o">.</span>)
     assert_equal expected, formatter.format(lexer.lex(source))
  end
end

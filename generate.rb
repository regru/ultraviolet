$LOAD_PATH.unshift "../lib"
require "uv"

def render(text, language, theme)
  Uv.parse(text, "xhtml", language, true, theme)
end

html = File.read("source.html").gsub(/^-------+hl (.*?)-+$(.*?)^-------------------------+$/m) do
  language, theme = $1.split(",")
  render($2, language, theme)
end

File.open("index.html", "w"){|f| f.write html }

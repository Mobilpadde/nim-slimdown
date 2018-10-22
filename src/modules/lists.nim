import nre, strutils

proc ul(m: RegexMatch): string =
    let item = m.captures[0].strip()
    "\n<ul>\n\t<li>$1</li>\n</ul>" % [item]

proc ol(m: RegexMatch): string =
    let item = m.captures[0].strip()
    "\n<ol>\n\t<li>$1</li>\n</ol>" % [item]

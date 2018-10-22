import nre, strutils 

proc bold(m: RegexMatch): string = "<strong>$1</strong>" % [m.captures[1]]

proc emphasis(m: RegexMatch): string = "<em>$1</em>" % [m.captures[1]]

proc strike(m: RegexMatch): string = "<del>$1</del>" % [m.captures[0]]

proc code(m: RegexMatch): string = "<code>$1</code>" % [m.captures[0]]

proc links(m: RegexMatch): string = "<a href='$2'>$1</a>" % [m.captures[0], m.captures[1]]

proc header(m: RegexMatch): string =
    let level = m.captures[0].len()
    let title = m.captures[1].strip()
    "<h$1>$2</h$1>" % [intToStr(level), title]

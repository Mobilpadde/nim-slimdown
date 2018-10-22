import nre

let matchers = @[
    re"\n\s[0-9]+\.(.*)", # ol
    re"\n\s\*(.*)", # ul

    re"(\*\*|__)(.*?)\1", # bold
    re"`(.*?)`", # code
    re"(\*|_)(.*?)\1", # emphasis
    re"\n(#+)(.*)", # header
    re"\[([^\[]+)\]\(([^\)]+)\)", # links
    re"\~\~(.*?)\~\~", # strike

    re"\n-{5,}", # hr
]

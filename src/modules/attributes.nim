import nre, strformat, strutils

# https://regex101.com/r/IazFFl/2/
let classesRe = re"(((?<=\{)|(?=\}))?(\s?\.([A-Za-z0-9]+)\s?)(?1)?)"
let classesFixRe = re"\."
# https://regex101.com/r/6YwI53/3
let classesTagRe = re"(?:\<(\w+)\>)(.+)(?:\<\/\w+\>)(?:\{)(class\=\'.*\')(?:\})"

let idsRe = re"(((?<=\{)|(?=\}))?(\s?\#([A-Za-z0-9]+)\s?)(?1)?)"
let idsFixRe = re"\#"
let idsTagRe = re"(?:\<(\w+)\>)(.+)(?:\<\/\w+\>)(?:\{)(id\=\'.*\')(?:\})"

let attrsRe = re"((?<=\{)|(?=\}))?(\s?([A-Za-z0-9]+)(\=)((?3))\s?)(?1)?"
let attrsTagRe = re"(?:\<(\w+)\>)(.+)(?:\<\/\w+\>)(?:\{)((\w+)\=\'(.*)\')(?:\})"

proc tagger(
    input: string,
    parserRe: Regex,
    fixRe: Regex,
    taggerRe: Regex,
    t: string
): string =
    let res = nre.replace(input, parserRe, proc(m: RegexMatch): string = 
        let thing = nre.replace(m.captures[0], fixRe, "")
        return "$1='$2'" % [t, thing]
    )

    return nre.replace(res, taggerRe, proc(m: RegexMatch): string =
        return "<$1 $2>$3</$1>" % [m.captures[0], m.captures[2], m.captures[1]]
    )

proc attrTagger(
    input: string,
    parserRe: Regex,
    taggerRe: Regex,
): string =
    let res = nre.replace(input, parserRe, proc(m: RegexMatch): string = 
        echo m.captures[4]
        return m.captures[2] & m.captures[3] & "'" & m.captures[4] & "'"
    )

    return nre.replace(res, taggerRe, proc(m: RegexMatch): string =
        return "<$1 $2>$3</$1>" % [m.captures[0], m.captures[2], m.captures[1]]
    )

proc attributes(input: string): string =
    result = tagger(input, classesRe, classesFixRe, classesTagRe, "class")
    result = tagger(result, idsRe, idsFixRe, idsTagRe, "id")
    result = attrTagger(result, attrsRe, attrsTagRe)
    return result

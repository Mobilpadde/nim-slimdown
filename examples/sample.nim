import strformat
import ../src/slackdown 

let toParse = """__slackdown__{.large .blue} is *awesome*{#red},
and even works w/ **attributes**{data-attrs=true}

 * All
 * in 
 * one

_weeeeeee_{.these #attributes data-are=awesome}
"""

let html = slackdown.parse(toParse)

echo &"""Generated HTML w/ attributes: 

{html}"""

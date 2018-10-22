# slackdown

## About

A simple form of markdown extended with attributes, based on [nim-slimdown](https://github.com/ruivieira/nim-slimdown)

## Building

Clone and run:

```
nimble build
nimble install
```

## Usage

```nim
import slackdown 

let toParse = """__slackdown__{.large .blue} is *awesome*{#red},
and even works w/ **attributes**{attrs=true}

 * All
 * in 
 * one

_weeeeeee_{.these #attributes data-are=awesome}
"""

let html = slackdown.parse(toParse)
```

will equal to

```html
<strong class='large blue'>slackdown</strong> is <em id='red'>awesome</em>,
and even works w/ <strong attrs='true'>attributes</strong>

<ul>
        <li>All</li>
</ul>
<ul>
        <li>in</li>
</ul>
<ul>
        <li>one</li>
</ul>

<em class='these 'id='attributes 'data-are='awesome'>weeeeeee</em>
```

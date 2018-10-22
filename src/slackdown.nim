# slackdown
# slimdown extended with attributes

import sequtils

include  modules/index

proc parse*(text: string): string =
    result = text
    for processor in zip(matchers, replacers):
        let (matcher, replacer) = processor
        result = nre.replace(result, matcher, replacer)

    return attributes(result)

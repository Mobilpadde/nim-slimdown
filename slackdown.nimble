# Package

version       = "0.0.1"
author        = "Mads Cordes"
description   = "A module based on Slimdown using RegEx. Extended Edition"
license       = "MIT"

# Dependencies

requires "nim >= 0.18.1" # no idea, really :D

bin      = @["slackdown"]
srcDir   = "src"
skipDirs = @["examples"]

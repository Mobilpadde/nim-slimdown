# Package

version       = "0.0.2"
author        = "Mads Cordes"
description   = "A module based on Slimdown using RegEx. Extended Edition"
license       = "MIT"

# Dependencies

requires "nim >= 0.18.1" # no idea, really :D

bin      = @["slackdown"]
srcDir   = "src"
skipDirs = @["examples","tests"]

# Tasks
task test, "Run test suite":
    exec "nim c -r tests/tester.nim"

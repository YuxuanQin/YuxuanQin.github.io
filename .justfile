alias b := build
alias v := view

build:
  uv run build.py build

view:
  uv run build.py preview

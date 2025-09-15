#! /usr/bin/env bash

pandoc -t revealjs --embed-resources --standalone --citeproc --slide-level=2 --bibliography references.bib presentation.md -o presentation.html

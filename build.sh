#!/usr/bin/env bash

set -e

typst c ./cv-all.typ
typst c ./cv-en.typ
typst c ./cv-de.typ

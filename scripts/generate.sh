#!/usr/bin/env bash
# Script used to generate the haskell file.
# Need to be run with nerd-fonts repo `../nerd-fonts` relative to it
#
# Derived from:
# https://github.com/ryanoasis/nerd-fonts/blob/41f27ae08bf5c57d0e7eb0cc4034cd7caa8de5b3/bin/scripts/lib/i_all.sh
# 
###############################################################################
# LICENSE 
#
# The MIT License (MIT)
#
# Copyright (c) 2025 Alexander 'ccntrq' Pankoff
# Copyright (c) 2014 Ryan L McIntyre
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
###############################################################################

source "../nerd-fonts/bin/scripts/lib/i_all.sh"

printf "module Graphics.Icons.NerdFont where\n\n"

for glyph in ${!i_*}; do
  name="$(echo "${glyph}" | sed -r 's/^i_//'| sed -r 's/([a-za-z])(^|_)(\w)/\1\u\3/g' )"
  printf "%s :: String\n" $name
  printf "%s = \"\\x%x\"\n\n"  "${name}" "'${!glyph}'"
done

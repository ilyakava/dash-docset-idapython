#!/bin/sh

find ./ -type f -exec sed -i -e 's/h1 class="epydoc">Class/h1 class="epydoc epydoc-class">Class/g' {} \;
find ./ -type f -exec sed -i -e 's/h1 class="epydoc">Module/h1 class="epydoc epydoc-module">Module/g' {} \;


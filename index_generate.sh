#!/bin/bash

# Print template up to %TEXT%.
cat index_template.html | awk 'NR==1,/%TEXT%/' | sed '$d'

# If the input overflows --columns pandoc will add a colgroup.
cat index.md | pandoc --columns 1000

# Print template after %TEXT%.
cat index_template.html | awk 'NR==1,/%TEXT%/{next}{print}'

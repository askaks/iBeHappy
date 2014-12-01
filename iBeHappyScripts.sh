#!/bin/sh

#  iBeHappyScripts.sh
#  iBeHappy
#
#  Created by Asia Szymczyk on 11/10/14.
#

echo "Hello, world!"

#PROJ=`find . -name '*.xib' -o -name '*.[mh]'`

#for png in `find . -name '*.png'`
#do
#name=`basename $png`
#if ! grep -qhs "$name" "$PROJ"; then
#echo "$png is not referenced"
#fi
#done

#TAGS="TODO:|FIXME:"
#echo "searching ${SRCROOT} for ${TAGS}"
#find "${SRCROOT}" \( -name "*.h" -or -name "*.m" \) -print0 | xargs -0 egrep --with-filename --line-number --only-matching "($TAGS).*\$" | perl -p -e "s/($TAGS)/ warning: \$1/"

find "${SRCROOT}" \( -name "*.h" -or -name "*.m" \) -print0
$grep "look for this" -name
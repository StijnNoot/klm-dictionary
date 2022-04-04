#!/usr/bin/env bash
#
# Script to format copied text from 3-column'ed table from Confluence
#
# Usage example:
#
#  cat fs | sed 's/\t/|/g' | CAT_ID=Flight_Status_1 CAT="Flight Status" IREF_HREF="https://confluence.devnet.klm.com/display/FSTB/Appron+-+Abbreviations+and+Definitions" IREF_TEXT="Appron - Abbreviations and Definitions" ./formatter.sh | pbcopy
#

set -e

while IFS='|' read -r k t d
do
    cat <<EOF
    <ar>
      <k>$k</k>
      <def>
        <deftext>
          $t
          <categ>(<kref idref="${CAT_ID?}">${CAT?}</kref>)</categ>
          <def>
            <deftext>
              $d
              <iref href="${IREF_HREF?}">${IREF_TEXT?}</iref>
            </deftext>
          </def>
        </deftext>
      </def>
    </ar>
EOF
done

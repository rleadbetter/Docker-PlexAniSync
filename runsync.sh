#!/bin/bash
echo "Updating settings.ini"
python settingsupdater.py

echo "Looking for custom mapping"
if [ ! -z "${CUSTOM_MAPPING_URL}" ]
then
  cp ${CUSTOM_MAPPING_URL} /plexanisync/custom_mappings.ini
else
  echo "No custom mapping found"
fi

while true
do
  (cd /plexanisync && python PlexAniSync.py)
  sleep ${INTERVAL}
done

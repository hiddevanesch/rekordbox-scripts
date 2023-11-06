# usage: python3 remove-memory-cues.py $XML_FILENAME

import xml.etree.ElementTree as ET
import sys

print('converting ' + sys.argv[1])

tree = ET.parse(sys.argv[1])
root = tree.getroot()

for track in root.findall('./COLLECTION/TRACK'):
    for position in track.findall('POSITION_MARK'):
        if int(position.get('Num')) == -1:
            # This is a memcue. Remove it
            track.remove(position)
    print('done: ' + track.get('Name'))

tree.write('rekordbox.xml', encoding='UTF-8', xml_declaration=True)

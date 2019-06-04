# -*- coding: utf-8 -*-
import xml.etree.ElementTree as et
import re

tree = et.parse('./dict.xdxf')
root = tree.getroot()

a = []


for new in tree.iter('ar'):
    k = new.find('k')
    fnd = re.match('(?:[A-Z]){2,}', k.text)
    if fnd != None:
        a.append(k.text)

print(a)
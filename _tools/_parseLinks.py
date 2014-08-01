#!/usr/bin/env python3

import json;
import sys;

def formatLink(title, url):
    print ("- [%s](%s) \n" % (title, url));

f = open('links.json')

links = json.load(f)
lib = sys.argv[1]

if lib in links:
    print ("External links:  \n")
    for link in links[lib]:
        formatLink(link["title"], link["url"])

f.close()
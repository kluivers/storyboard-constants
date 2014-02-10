#!/usr/bin/env python

import sys, os
import xml.etree.ElementTree as et

PREFIX = "jbw"

identifiers = {}

def addIdentifier(identifier):
	key = identifier[0].upper() + identifier[1:]
	if not key.startswith(PREFIX.upper()):
		key = PREFIX.upper() + key
	
	identifiers[key] = identifier

def process_storyboard(file):
    tree = et.parse(file)
    root = tree.getroot()

    for segue in root.iter("segue"):
        segueIdentifier = segue.get("identifier")
        if segueIdentifier == None:
            continue;
        addIdentifier(segueIdentifier)

count = os.environ["SCRIPT_INPUT_FILE_COUNT"]
for n in range(int(count)):
    process_storyboard(os.environ["SCRIPT_INPUT_FILE_" + str(n)])

allConstants = sorted(identifiers.keys())

with open(sys.argv[1], "w+") as header:
    header.write("/* Generated document. DO NOT CHANGE */\n\n")
    header.write("/* Segue identifier constants */\n")

    for constantName in allConstants:
        header.write("extern NSString * const " + constantName + ";\n")
    
    header.close()

with open(sys.argv[2], "w+") as implementation:
    implementation.write("/* Generated document. DO NOT CHANGE */\n\n")
    
    for constantName in allConstants:
        implementation.write("NSString * const " + constantName + " = @\"" + identifiers[constantName] + "\";\n")
    
    implementation.close()


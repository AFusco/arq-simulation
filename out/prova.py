#!/usr/bin/python
# encoding: utf-8

import sys
import csv
from ConfigParser import ConfigParser

ini = ConfigParser()
ini.readfp(sys.stdin)

#Find all keys in the INI file to build a row template and
#include a "game" field to store the section name.
rowTemplate = {"game":""}
for sec in ini.sections():
   for key,value in ini.items(sec):
       rowTemplate[key] = ""

#Write the CSV file to stdout with all fields in the first line
out = csv.writer(sys.stdout)
out = csv.DictWriter(sys.stdout, fieldnames=rowTemplate.keys())
out.writeheader()

#Write all rows
for sec in ini.sections():
   row = rowTemplate.copy()
   row["game"] = sec
   for key,value in ini.items(sec):
       row[key] = value
   out.writerow(row)

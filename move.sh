#!/bin/bash
# Name: Renee Brandt
# Purpose: Work with a data file someFile.txt to generate additional files based on pattern alterations using sed.


# Insert a heading line to the top of the file and output resulting data to file move1.txt
sed '1i Name Phone Number Jan Feb March' someFile.txt > move1.txt

# Duplicate move1.txt into move2.txt, replacing Hauschild with Housechild
sed 's/Hauschild/Housechild/Ig' move1.txt > move2.txt

# Put the list of donors' names (first + last) with area code 916 in file move3.txt
sed -n '/(916)/p' someFile.txt | sed 's/\,.*//' > move3.txt

# Put first names of anyone starting with M or R in move4.txt
sed -n '/^[mr]/Ip' someFile.txt | sed 's/ .*//' > move4.txt

#Find people who donated $500+ in any month and save full name + phone number to move5.txt. File should sort names by last name.
sed -n '/$[5-9][0-9][0-9][0-9]*/p' someFile.txt > move5.txt
sed -n '/$[1-4][0-9][0-9][0-9][[0-9]*/p' someFile.txt >> move5.txt
sed 's/$.*//' move5.txt > move5temp.txt
sed 's/\([a-z]*\)\( [a-z]*\,\)\(.*\)/\2\1\3/Ig' move5temp.txt > move5.txt
sed 's/^ //g' move5.txt | sed 's/\,$//' | sed 's/(/\,(/' > move5temp.txt
sort move5temp.txt > move5.txt
rm move5temp.txt



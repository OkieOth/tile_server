#!/bin/bash

if [ -z "$1" ]; then
    echo "need as first parameter the original style file to replace the colors"
    exit 1
fi


fileToReplace=$1

cat $1 | sed -e 's-#000080-#717182-g' \
     -e 's-#0000ff-#9599a8-g' \
     -e 's-#008000-#738071-g' \
     -e 's-#0092da-#8b999f-g' \
     -e 's-#0c8416-#798579-g' \
     -e 's-#0e9b19-#808d7f-g' \
     -e 's-#28c98a-#969f9c-g' \
     -e 's-#323b00-#69685b-g' \
     -e 's-#3ced4a-#a3afa4-g' \
     -e 's-#444c03-#707163-g' \
     -e 's-#4863a0-#94969a-g' \
     -e 's-#498400-#7c8373-g' \
     -e 's-#4ab9d9-#a2aaac-g' \
     -e 's-#4c2e00-#706b62-g' \
     -e 's-#4c4c00-#707062-g' \
     -e 's-#4d3300-#716d62-g' \
     -e 's-#4d80b3-#9a9ea1-g' \
     -e 's-#543800-#746f64-g' \
     -e 's-#576ddf-#a8aab1-g' \
     -e 's-#5d1b0b-#796f6d-g' \
     -e 's-#60adc3-#a4a9aa-g' \
     -e 's-#612617-#7c7473-g' \
     -e 's-#620728-#7a6c71-g' \
     -e 's-#660033-#7a6a72-g' \
     -e 's-#664400-#7a746a-g' \
     -e 's-#6666ff-#b5b5c0-g' \
     -e 's-#6699ff-#b5b8c0-g' \
     -e 's-#6f5c4e-#8e8c8a-g' \
     -e 's-#707d05-#818273-g' \
     -e 's-#734a08-#807a71-g' \
     -e 's-#741334-#82767a-g' \
     -e 's-#7981b0-#a7a8aa-g' \
     -e 's-#8461c4-#a7a4ab-g' \
     -e 's-#928f8f-#a7a6a6-g' \
     -e 's-#960000-#8a7777-g' \
     -e 's-#996600-#8a8478-g' \
     -e 's-#9999ff-#c7c7cf-g' \
     -e 's-#99cccc-#b8bcbc-g' \
     -e 's-#99ccff-#c7cbcf-g' \
     -e 's-#9a826f-#a2a09e-g' \
     -e 's-#9eae23-#96978a-g' \
     -e 's-#a06b00-#8c867a-g' \
     -e 's-#a07070-#a4a0a0-g' \
     -e 's-#aa9254-#a09e9a-g' \
     -e 's-#aacbaf-#bec0be-g' \
     -e 's-#aad3df-#c3c7c7-g' \
     -e 's-#aaddaa-#c3c7c3-g' \
     -e 's-#aae0cb-#c3c8c7-g' \
     -e 's-#ac39ac-#9b929b-g' \
     -e 's-#ac46ac-#9f99a0-g' \
     -e 's-#add19e-#bdbfbb-g' \
     -e 's-#aed1a0-#bdc0bc-g' \
     -e 's-#aedfa3-#c2c6c1-g' \
     -e 's-#af9c8d-#afaead-g' \
     -e 's-#b27f36-#9c9892-g' \
     -e 's-#b31806-#938381-g' \
     -e 's-#b5e3b5-#c8cdc8-g' \
     -e 's-#b6b592-#b2b2b0-g' \
     -e 's-#b9a99c-#b6b5b5-g' \
     -e 's-#bba4b7-#b9b7b9-g' \
     -e 's-#bbbbcc-#c4c4c6-g' \
     -e 's-#bf0000-#968282-g' \
     -e 's-#c00022-#968286-g' \
     -e 's-#c24e6b-#a69ea0-g' \
     -e 's-#c38a27-#9e9992-g' \
     -e 's-#c5c3c3-#c5c5c5-g' \
     -e 's-#c6b3c3-#c1c0c1-g' \
     -e 's-#c77400-#989084-g' \
     -e 's-#c7afaf-#c0bebe-g' \
     -e 's-#c7c7b4-#c2c2c0-g' \
     -e 's-#c7c9ae-#c0c0bf-g' \
     -e 's-#c84e2f-#a09896-g' \
     -e 's-#c8d7ab-#c3c5c1-g' \
     -e 's-#c8facc-#d8ddd8-g' \
     -e 's-#cdbea0-#bebdbb-g' \
     -e 's-#cdebb0-#cccec9-g' \
     -e 's-#cf6649-#a8a2a0-g' \
     -e 's-#d08f55-#aca8a4-g' \
     -e 's-#d1b2b0-#c4c2c2-g' \
     -e 's-#d1b48c-#bab8b5-g' \
     -e 's-#d1c6bd-#c8c7c7-g' \
     -e 's-#d40000-#9b8888-g' \
     -e 's-#d6d99f-#c2c2be-g' \
     -e 's-#d99c95-#c0bbba-g' \
     -e 's-#d9d0c9-#cfcecd-g' \
     -e 's-#dadae0-#d7d7d7-g' \
     -e 's-#dc2a67-#a5999d-g' \
     -e 's-#dddde8-#dbdbdc-g' \
     -e 's-#ddecec-#dcdede-g' \
     -e 's-#def6c0-#d5d8d3-g' \
     -e 's-#dfddce-#d3d3d2-g' \
     -e 's-#dffce2-#e2e5e2-g' \
     -e 's-#e0dfdf-#d9d9d9-g' \
     -e 's-#e2c5bb-#cecccb-g' \
     -e 's-#e2cbde-#d4d1d3-g' \
     -e 's-#e66e89-#bab1b2-g' \
     -e 's-#e892a2-#c4bdbf-g' \
     -e 's-#e9e7e2-#dedede-g' \
     -e 's-#ebdbe8-#dddbdc-g' \
     -e 's-#eee5dc-#dedddd-g' \
     -e 's-#eef0d5-#ddddda-g' \
     -e 's-#efc8c8-#d8d5d5-g' \
     -e 's-#f1bcc6-#d5d0d1-g' \
     -e 's-#f2dad9-#dfdddd-g' \
     -e 's-#f2efe9-#e4e4e3-g' \
     -e 's-#f3c380-#c3bfba-g' \
     -e 's-#f3e3dd-#e1dfdf-g' \
     -e 's-#f3f7f7-#eaeaea-g' \
     -e 's-#f5977a-#c2bbb9-g' \
     -e 's-#f5dcba-#d5d4d0-g' \
     -e 's-#f5e9c6-#dad8d5-g' \
     -e 's-#f7fabf-#d9d9d4-g' \
     -e 's-#f9b29c-#cdc7c6-g' \
     -e 's-#fa8072-#c1b8b7-g' \
     -e 's-#fafcd7-#e2e2df-g' \
     -e 's-#fcd6a4-#d1ceca-g' \
     -e 's-#fcd7cc-#dfdbda-g' \
     -e 's-#feecd5-#e2e1df-g' \
     -e 's-#ff5555-#bbafaf-g' \
     -e 's-#ffc0cb-#dcd6d7-g' \
     -e 's-#ffd6d1-#e1dede-g' \
     -e 's-#fff1ba-#dad8d4-g' \
     -e 's-#ffff32-#b2b2a4-g' \
     -e 's-#ffffe5-#e9e9e6-g' 

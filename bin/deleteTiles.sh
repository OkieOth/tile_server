#!/bin/bash

scriptPos=${0%/*}

sudo rm -rf $scriptPos/../volumes/tiles
mkdir $scriptPos/../volumes/tiles

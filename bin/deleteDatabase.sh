#!/bin/bash

scriptPos=${0%/*}

sudo rm -rf $scriptPos/../volumes/db

mkdir $scriptPos/../volumes/db


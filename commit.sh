#!/bin/bash
touch $1.swift
echo  $2 >> $1.swift
git add .
git commit -m $1.swift
git push



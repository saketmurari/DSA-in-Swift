#!/bin/bash
touch $1.swift
printf $2 >> $1.swift
git add .
git commit -m "test commit"
git push



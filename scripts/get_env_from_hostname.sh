#!/bin/bash
hostname=$(hostname)

split_host=$(echo $hostname | tr "-" " ")

arr=(`echo ${split_host}`)

echo ${arr[0]}| tr '[:upper:]' '[:lower:]'
#!/bin/bash

timestamp=$(date +"%Y-%m-%dT%H-%M")
output_file="kernel-logs-$timestamp.txt"
compressed_file="kernel-logs-$timestamp.tar.bz2"

journalctl -k --since "1 hour ago" > "$output_file"


tar -cvjf "$compressed_file" "$output_file"

dbxcli put "$compressed_file" /path/to/dropbox/folder/

rm "$output_file" "$compressed_file"

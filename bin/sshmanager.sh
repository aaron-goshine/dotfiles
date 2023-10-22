#! /bin/bash
# Author: Aaron
# Script: Your Script Name
# Date: (Today's Date)
# Description: (Brief description of the script)

# Your code here
# Author: Aaron
# Script: SSH manager adds, list or remove host from your ssh config 
# Sun Oct 22 15:13:59 BST 2023
# Description: (Brief description of the script)

# Your code here


#!/bin/bash

SSH_CONFIG="$HOME/.ssh/config"

function list_keys {
  echo "Listing SSH keys:"
  ls -l $HOME/.ssh/*.pub 2>/dev/null
}


function add_entry {
  echo "Host $1" >> $SSH_CONFIG
  echo "  HostName $2" >> $SSH_CONFIG
  echo "  Port $3" >> $SSH_CONFIG

  if [ ! -z "$4" ]; then
    echo "  IdentityFile $4" >> $SSH_CONFIG
  fi

  if [ ! -z "$5" ]; then
    echo "$5" | pass insert -e "ssh/$1"

  fi
  echo "Entry for $1 added."
}


function delete_entry {
  sed -i.bak "/Host $1/,+2d" $SSH_CONFIG
  echo "Entry for $1 deleted."
}

function list_entries {
  grep "Host " $SSH_CONFIG
}

function search_entries {
  grep "Host " $SSH_CONFIG | grep "$1"
}


function connect_host {
  hostname=$(grep -A 1 "Host $1" $SSH_CONFIG | grep "HostName" | awk '{print $2}')

  # Check if an IdentityFile is specified for this host
  keyfile=$(grep -A 3 "Host $1" $SSH_CONFIG | grep "IdentityFile" | awk '{print $2}')

  if [ -z "$keyfile" ]; then
    password=$(pass "ssh/$1")

    if [ -z "$password" ]; then
      echo "Password for $1 does not exist in pass."
      exit 1
    fi

    expect <<EOD
      spawn ssh $hostname
      expect "assword:"
      send "$password\r"
      interact
EOD
else
  ssh $hostname
  fi
}

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 {add|delete|list|search} [options]"
  exit 1
fi

case "$1" in
  add)
    if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
      echo "Usage: $0 add [alias] [hostname] [port] [optional: identity_file]"
      exit 1
    fi
    add_entry "$2" "$3" "$4" "$5"
    ;;
  delete)
    if [ "$#" -ne 2 ]; then
      echo "Usage: $0 delete [alias]"
      exit 1
    fi
    delete_entry "$2"
    ;;
  list)
    list_entries
    ;;
  keys)
    list_keys
    ;;
  connect)
    if [ "$#" -ne 2 ]; then
      echo "Usage: $0 connect [alias]"
      exit 1
    fi
    connect_host "$2"
    ;;
  search)
    if [ "$#" -ne 2 ]; then
      echo "Usage: $0 search [keyword]"
      exit 1
    fi
    search_entries "$2"
    ;;
  *)
    echo "Invalid command: $1"
    exit 1
    ;;
esac

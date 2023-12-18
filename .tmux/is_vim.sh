#!/usr/bin/env bash
# Usage: is_vim.sh <tty>
#   tty: Specify tty to check for vim process.
tty=$1

# Construct process tree.
children=();
pids=( $(ps -o pid= -t $tty) )

while read -r pid ppid
do
  [[ -n pid && pid -ne ppid ]] && children[ppid]+=" $pid"
done <<< "$(ps -Ao pid=,ppid=)"

# Get all descendant pids of processes in $tty with BFS
idx=0
while (( ${#pids[@]} > idx ))
do
  pid=${pids[idx++]}
  pids+=( ${children[pid]-} )
done
echo "pids=${pids[@]}"
echo `ps -o state=,comm= -p "${pids[@]}" | grep -iE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?l?vim?x?)(diff)?$'`

# Check whether any child pids are vim
ps -o state=,comm= -p "${pids[@]}" | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?l?vim?x?)(diff)?$'
exit $?

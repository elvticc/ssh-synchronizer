#! /usr/bin/env bash
#
# SSH Synchronizer
##

main () {

    local -r rsync_filename="sync.sh"
    local -r private_key_path="/path/to/folder/.ssh/private_key"
    local -r local_path="./"
    local -r remote_path="~/path/to/folder/"
    local -r username="username"
    local -r host_server="localhost"

    rsync -rtvze "ssh -i ${private_key_path}" --exclude "${rsync_filename}" \
        "${local_path}" "${username}@${host_server}:${remote_path}"

}

main

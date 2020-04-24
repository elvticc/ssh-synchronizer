# SSH Synchronizer

SSH Synchronizer is a utility for monitoring a local folder and transmitting each modification of the files to a remote server with SSH.

The monitoring of a local folder is done with [fswatch](https://github.com/emcrisostomo/fswatch) and the transmitting of file modifications with [rsync](https://ss64.com/bash/rsync.html).

## Getting Started

### Prerequisites

* MacOS or Linux operating system.
* MacPorts or HomeBrew installed.
* SSH key pairs generated. (see [ssh-keygen](https://www.ssh.com/ssh/keygen/))
* _Authorized_keys_ file configured. (see [authorized_keys](https://www.ssh.com/ssh/authorized_keys/) and [Infomaniak FAQ](https://faq.infomaniak.com/2054))

### Installation

#### fswatch utility

In Terminal, run one of the following commands to intall _fswatch_ CLI.

_MacPorts_
```shell
port install fswatch
```

_HomeBrew_
```shell
brew install fswatch
```

### Alias

In Terminal profile file (.bash_profile, .zprofile, etc.), add the following alias.

```shell
alias ssh_sync="fswatch -o '$PWD' | xargs -n1 -I{} './sync.sh'"
```

## Usage

### sync.sh file

Create the **sync.sh** file at the root of your project folder with the content below.

```shell
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
```

## Start

In Terminal, navigate to your project root folder and run `ssh_sync` alias to start the utility.

## Known issues

### Permission denied with sync.sh file

Most of the time, it is related to the execution permission of the file.

```shell
chmod +x ./path/to/folder/sync.sh
```

## Sources

* https://brycematheson.io/auto-sync-local-remote-rsync/
* https://unix.stackexchange.com/a/175673

## License

Distributed under the MIT License. See [LICENSE](https://github.com/elvticc/ssh-synchronizer/blob/master/LICENSE) for more information.

## Contact

Benjamin Grand [@elvticc](https://twitter.com/elvticc)

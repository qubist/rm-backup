# rm-backup

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

A small script to back up reMarkable locally.

## Background

The [reMarkable Wiki](https://remarkablewiki.com/tech/ssh#making_backups) describes how to make backups, and suggests doing so often before sshing into the device and making changes as root. This script simply automates the Wiki's instructions and makes them available as a command in zsh.

## Install

0. [Make sure SSH access is set up](https://remarkablewiki.com/tech/ssh)
1. Put [`rm-backup.zsh`](/rm-backup.zsh) into your custom directory:
    * `cp rm-backup.zsh ~/.om-my-zsh/custom`
2. Edit the `BACKUPDIR` variable to be the path to the directory in which you want to make backups.
3. Reload zsh:
    * `zsh`

## Usage

0. Make sure your reMarkable is plugged in to your computer and awake.
1. Run the command:

```bash
rm-backup
```

## Contributing

PRs accepted. This isn't very advanced at the moment, happy to see it become more robust.

## License

[MIT](LICENSE)

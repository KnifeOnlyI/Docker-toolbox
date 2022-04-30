# Docker tools

A dockerfile to auto-configure a toolbox contains the following tools :

- [GCC/G++/GDB](https://gcc.gnu.org/)
- [Make](https://www.gnu.org/software/make/)
- [CMake](https://cmake.org/)
- [NASM](https://www.nasm.us/)
- [NodeJS](https://nodejs.org/)
- [Git](https://git-scm.com/)
- [Vim](https://www.vim.org/)
- [Python 3](https://www.python.org/)

## Configuration

Put your SSH configuration in the .ssh directory

### SSH configuration

To create an SSH key :
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Example of config file (for github and gitlab) :
```
Host github.com
    User user1@test.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/github_User1

Host github.com
    User user2@test.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/github_User2

Host gitlab.com
    User user1@test.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/gitlab_User1
```

## Commands

Build docker file with tag :

```bash
docker build -t <tag> . --build-arg git_username="<value>" --build-arg git_email="<value>" --no-cache
```

Run the container for first time :

```bash
docker run --name <name> -ti -d <tag>
```

Stop the container :

```bash
docker stop <name>
```

Restart the stopped container :

```bash
docker restart <name>
```
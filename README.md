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

## Commands

Build docker file with tag :

```bash
docker build -t <tag> . --build-arg git_username="<value>" --build-arg git_email="<value>" --no-cache
```

Run the container for first time :

```bash
docker run --name <name> -ti -d -p 2222:22 <tag>
```

Stop the container :

```bash
docker stop <name>
```

Restart the stopped container :

```bash
docker restart <name>
```
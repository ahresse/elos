
![build](https://github.com/Elektrobit/elos/actions/workflows/build-and-test.yml/badge.svg)
![documentation](https://github.com/Elektrobit/elos/actions/workflows/build-documentation.yml/badge.svg)

# Event Logging and Management System (elos)

<img src="doc/static/elos_blue.svg" width=20% height=20% align="right">

elos is a tool to collect, store and publish various system events (i.e. syslogs, core dumps, measurements obtained from proc- and sys-fs, …) while providing easy access to the collected data.


## Documentation

The elos documentation can be found here: https://elektrobit.github.io/elos/

## Quick start

### Try elos

```bash
./ci/docker-target-run.sh
...
ci@2153762153:/$ elosc -f "1 1 EQ"
...
ci@2153762153:/$ elosc -s "1 1 EQ"
```

On a second shell attach to the running container

```bash
docker exec -ti <elos_container_name> bash
ci@2153762153:/$ elosc -p '{"payload": "Hello elos"}'
```

For detailed build instructions have a look into `./ci/docker-target-run.sh`
and/or consult the documentation https://elektrobit.github.io/elos .


## Building

elos uses CMake for building:

```bash
cmake -B ./build ./
make -C ./build all
make -C ./build install
```

## Development

For a quick start to get hands on the code and start coding use :
```bash
./ci/docker-run.sh
```
You are now in a ready to use development environment. To build elos and all
dependencies run:
```bash
ci@62209400:/base$ ./ci/build.sh
```
To start elosd and play with your changes:
```bash
ci@62209400:/base$ ./test/smoketest/smoketest_interactive.sh
[elos-interactive]$ elosd&
...
[elos-interactive]$ elosc -f "1 1 EQ"
...
[elos-interactive]$ elosc -s "1 1 EQ"&
...
[elos-interactive]$ elosc -p '{"payload": "Hello elos"}'
...
[elos-interactive]$ elosc # be creative
```
Be aware this is a smoketest environment so it is very verbose.

### Workspace setup

1. Please run the following git commands after cloning the repository:

   ```bash
   git config core.hooksPath .githooks
   ```

   to set the commit message template and to setup the project specific git hooks.

2. Usually it is a good idea to create a symlink to the compilation database
   created by cmake in the build directory. Run therefore:

   ```
   ln -s build/<BUILD_TYPE>/cmake/compile_commands.json
   ```

## Dependencies

* [cmocka_extensions](https://github.com/Elektrobit/cmocka_extensions)
* [cmocka_mocks](https://github.com/Elektrobit/cmocka_mocks)
* [safu](https://github.com/Elektrobit/safu).
* [samconf](https://github.com/Elektrobit/samconf).

## Folders

In general each folder and subfolder should contain a `index.rst` or `.md`
files to explain there content by themself. This shall give a brief overview
where to start when looking for something specific.

### ci

Scripts to be used by CI pipelines to build, run various tests and checks.

### cmake

Contains cmake extensions and scripts to simplify and generalize recurring tasks.

### doc

Contains :

* static assets for the documentation
* the Architecture Design Records
* documentation on the documentation itself
* other documents

### src

Contains the actual productive sources.

### test

Contains all test related sources. See the documentation for details.


## License

MIT License

Copyright (c) [2023] [emlix GmbH, Elektrobit Automotive GmbH]

The full text of the license can be found in the [LICENSE](LICENSE) file in the repository root directory.

### Powered by EB

<img src="doc/static/eb-logo.png" width=70 height=70 align="left">
elos is powered by elektrobit automotive gmbh.
Elektrobit is an automotive software company and developer of embedded software products for ECU, AUTOSAR, automated driving, connected vehicles and UX.
elos isan  integrated part of EB corbos Linux – built on Ubuntu is an open-source operating system for high-performance computing, leveraging the rich functionality of Linux while meeting security and industry regulations.


### Maintainers

* Wolfgang Gehrhardt wolfgang.gehrhardt@emlix.com [@gehwolf](https://github.com/gehwolf)
* Thomas Brinker thomas.brinker@emlix.com [@ThomasBrinker](https://github.com/ThomasBrinker)

### Credits

* Andreas Schickedanz
* Andreas Zdziarstek
* Anja Lehwess-Litzmann
* Annika Schmitt
* Anton Hillerband
* Benedikt Braunger
* Christian Steiger
* Daniel Glöckner
* Fabian Godehardt
* Friedrich Schwedler
* Joerg Vehlow
* Maryniuk Bogdan
* Rainer Müller
* Sabrina Otto
* Thomas Brinker
* Vignesh Jayaraman
* Wolfgang Gehrhardt

### Artwork

The elos logo is the Vombatus ursinus, also known as the bare-nosed wombat,
designed from the handwriting word elos. Originator is Anja Lehwess-Litzmann
(emlix GmbH). Year 2023. It is licensed under Creative Commons No Derivatives
(CC-nd). It shall be used in black on white or HKS43 color.

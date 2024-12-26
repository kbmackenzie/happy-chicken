Happy Chicken is a readable variant of the [Chicken esoteric language][1]. It compiles to valid Chicken. 🐔

Its implementation is a tiny, self-contained, POSIX-compliant **Awk** script. It should work out-of-the-box on most Linux distros.

Its syntax consists of one instruction per line. Some instructions have operands. Instruction names are kept accurate to the [Chicken esolang's VM specification][2].

```bash
# Comments are allowed, too!
chicken
push 3
push 10
rooster
push 2
add
BBQ
add
push 6
push 10
rooster
BBQ
add
push 3
add
```

**Note:** The example above prints "`chicken <3`".

## Installation

All you really need to do is copy the Awk script to a directory available in your PATH.

If you wish, you can install it with [make][3]:

1. Clone the `happy-chicken` repository.
2. Enter the cloned repository directory and do `make install`:

```bash
git clone https://github.com/kbmackenzie/happy-chicken.git
cd happy-chicken
make install
```

This will install the script to `~/.local/bin` by default. If you wish to install it somewhere else, just set the `PREFIX` variable:

```bash
make PREFIX=/usr/local/bin install
```

## Documentation

All the documentation can be found [here](./docs/happy-chicken.md).

[1]: https://web.archive.org/web/20180816190122/http://torso.me/chicken
[2]: https://web.archive.org/web/20180812101335/http://torso.me/chicken-spec
[3]: https://www.gnu.org/software/make/

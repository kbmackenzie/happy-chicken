Happy Chicken is a readable variation of the [Chicken esoteric language][1]. It compiles to valid Chicken source code. It's designed to make writing silly Chicken programs a little easier.

Its implementation is a tiny, self-contained, POSIX-compliant **Awk** script. It should run out-of-the-box on most Linux distros. 🐔

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

**Note:** The example above prints "`chicken <3`". :)

[1]: https://web.archive.org/web/20180816190122/http://torso.me/chicken
[2]: https://web.archive.org/web/20180812101335/http://torso.me/chicken-spec

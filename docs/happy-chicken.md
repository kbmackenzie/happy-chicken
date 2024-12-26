Happy Chicken is a readable variant of the [Chicken esoteric language][1]. It compiles to valid Chicken. 🐔

Its implementation is a tiny POSIX-compliant **Awk** script.

## Table of Contents

1. [Syntax](#syntax)
    1. [Instructions](#instructions)
    2. [Comments](#comments)
    3. [Whitespace](#whitespace)

## Syntax

### Instructions

Instruction names are kept accurate to the [Chicken esolang's VM specification][2].

The following instructions are available:

| Instruction | Operand    | Description                                                                                                |
|-------------|------------|------------------------------------------------------------------------------------------------------------|
| chicken     |            | Pushes the string "chicken" onto the stack.                                                                |
| add         |            | Pops two values, adds them and pushes the result.                                                          |
| fox         |            | Pops two values, subtracts them and pushes the result.                                                     |
| rooster     |            | Pops two values, multiplies them and pushes the result.                                                    |
| compare     |            | Pops two values, compares them for [loose equality][3] and pushes the result.                              |
| pick        | 0 or 1     | Pops a value and uses it as an address to read from stack (0) or standard input (1), pushing the result.   |
| peck        |            | Pops a value and uses it as an address, pops another value and stores it in that address.                  |
| fr          |            | Pops a value and uses it as an offset, pops another and checks if it's truthy. If so, jump by that offset. |
| BBQ         |            | Pops a value and converts it to a char by its corresponding ASCII code.                                    |
| push        | any number | Pushes a number onto the stack.                                                                            |

### Comments

Lines starting with a `#` are considered comments and are ignored.

```bash
# This is a comment.
push 2
# This is also a comment!
```

Comments cannot appear before nor after instructions. They must always be in their own line.

### Whitespace

Whitespace follows a few rules:

1. Linebreaks are meaningful.
2. Empty lines are ignored.
3. Spaces between instructions and operands is ignored.

[1]: https://web.archive.org/web/20180816190122/http://torso.me/chicken
[2]: https://web.archive.org/web/20180812101335/http://torso.me/chicken-spec
[3]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Equality

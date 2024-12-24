#!/bin/awk -f

BEGIN {
  # Instruction -> opcode map. 🐔
  # Instruction names are accurate to the VM specification.
  instructions["axe"]     = 0
  instructions["chicken"] = 1
  instructions["add"]     = 2
  instructions["fox"]     = 3
  instructions["rooster"] = 4
  instructions["compare"] = 5
  instructions["pick"]    = 6  # Note: The 'pick' instruction has an *operand*.
  instructions["peck"]    = 7
  instructions["fr"]      = 8
  instructions["BBQ"]     = 9
}

function chicken(count,   output) {
  if (count <= 0) { return "" }
  output = "chicken"
  while (--count > 0) {
    output = output " chicken"
  }
  return output
}

function is_number(value) {
  return value ~ /^[[:digit:]]+$/
}

# Comments should be skipped.
/^#/ {
  next
}

# Whitespace and empty lines should also be skipped.
/^[[:blank:]]*$/ {
  next
}

($1 in instructions) {
  opcode = instructions[$1]
}

($1 == "push") {
  if (!is_number($2)) {
    syntax_error("expected numeric operand for 'push' instruction, got: " ($2 || "<nothing>"))
  }
  opcode = $2 + 10
  print chicken(opcode)
  next
}

($1 == "pick") {
  if (!is_number($2)) {
    syntax_error("expected numeric operand for 'pick' isntruction, got: " ($2 || "<nothing>"))
  }
  opcode  = instructions[$1]
  operand = $2
  print chicken(opcode)
  print chicken(operand)
  next
}

($1 in instructions) {
  opcode = instructions[$1]
  print chicken(opcode)
  next
}

# If we get here, we have an invalid instruction.
# Handle it accordingly.
{
  syntax_error("invalid instruction: " $0)
}

function syntax_error(message) {
  print "line " NR ":", message > "/dev/stderr"
  exit 1
}

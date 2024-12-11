#!/bin/sh

# A simple file-oriented test suite for Happy Chicken.
SCRIPT='./src/happy-chicken.awk'

echo_error() {
  echo "$1" 1>&2
}

TEST_LIST=$(ls ./test)
TEST_COUNT=$(echo "$TEST_LIST" | wc -l)
FAIL_COUNT=0

echo "Running tests..."

for TEST in $TEST_LIST; do
  TEST_PATH="./test/${TEST}"

  # Compare program output with expected output through 'diff'.
  # When the two differ, this means a test failed.
  $SCRIPT "${TEST_PATH}/input.happy" | diff --color - "${TEST_PATH}/expect.chicken"

  if [ $? -ne 0 ]; then
    FAIL_COUNT=$((FAIL_COUNT + 1))
    TEST_RESULT='❌'
  else
    TEST_RESULT='✅'
  fi
  echo "  ${TEST}: [${TEST_RESULT}]"
done

if [ $FAIL_COUNT -gt 0 ]; then
  echo_error "$((TEST_COUNT - FAIL_COUNT)) passed, $FAIL_COUNT failed"
  exit 1
else
  echo "All tests passed."
fi

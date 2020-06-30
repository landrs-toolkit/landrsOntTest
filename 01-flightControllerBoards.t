#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for sensor shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/flightControllerBoard"
ONTDIR="$SHARNESS_TEST_DIRECTORY"


test_expect_success "Test  flightControllerBoards " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/flightControllerBoard_shape.ttl' '$TESTDIR/flightControllerBoard.ttl'
"

test_done

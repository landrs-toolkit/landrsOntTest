#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for sensor shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/flightControlSystem"
ONTDIR="$SHARNESS_TEST_DIRECTORY"


test_expect_success "Test  flightControlSystems " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/flightControlSystem_shape.ttl' '$TESTDIR/flightControlSystem.ttl'
"

test_done

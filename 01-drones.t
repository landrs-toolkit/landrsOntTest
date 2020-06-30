#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for drone shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/drone"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: Old drone KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/drones_old.ttl'
#"

test_expect_success "Test new little drone " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/drone_shape.ttl' '$TESTDIR/drone.ttl'
"

test_done

#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for flight shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/flight"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE:  flight KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/flights_old.ttl'
#"

test_expect_success "Test flight " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/flight_shape.ttl' '$TESTDIR/flight.ttl'
"

test_done

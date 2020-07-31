#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for place shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/place"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: place KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/places_old.ttl'
#"

test_expect_success "Test place " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/place_shape.ttl' '$TESTDIR/place.ttl'
"

test_done

#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for observationCollection shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/observationCollection"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: Old observationCollection KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/observationCollections_old.ttl'
#"

test_expect_success "Test new little observationCollection " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/observationCollection_shape.ttl' '$TESTDIR/observationCollection.ttl'
"

test_done

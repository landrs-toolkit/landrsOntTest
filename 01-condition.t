#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for condition shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/condition"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: Old condition KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/conditions_old.ttl'
#"

test_expect_success "Test new little condition " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/condition_shape.ttl' '$TESTDIR/condition.ttl'
"

test_done

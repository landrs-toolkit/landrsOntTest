#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for timeEntity shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/timeEntity"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: timeEntity KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/timeEntitys_old.ttl'
#"

test_expect_success "Test timeEntity " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/timeEntity_shape.ttl' '$TESTDIR/timeEntity.ttl'
"

test_done

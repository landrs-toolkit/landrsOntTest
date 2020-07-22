#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for dataAquisition shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/dataAquisition"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: Old DataAquisition KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/dataAquisition_old.ttl'
#"

test_expect_success "Test dataAquisition " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/dataAquisition_shape.ttl' '$TESTDIR/dataAquisition.ttl'
"

test_done

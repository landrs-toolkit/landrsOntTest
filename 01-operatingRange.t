#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for OperatingRange shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/operatingRange"
ONTDIR="$SHARNESS_TEST_DIRECTORY"


test_expect_success "Test OperatingRange " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/operatingRange_shape.ttl' '$TESTDIR/operatingRange.ttl'
"

test_done
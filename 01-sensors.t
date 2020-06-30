#!/bin/sh
# vi: set ft=sh :


test_description="LANDRs ontology tests for sensor shapes"

. ./sharness.sh

TESTDIR="$SHARNESS_TEST_DIRECTORY/sensor"
ONTDIR="$SHARNESS_TEST_DIRECTORY"

# test_expect_failure "FAILURE: Old sensor KG" "
#    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/shape.ttl' '$TESTDIR/sensors_old.ttl'
#"

test_expect_success "Test new little sensor " "
    pyshacl -m -i rdfs -e '$ONTDIR/ontology.ttl' -s '$TESTDIR/sensor_shape.ttl' '$TESTDIR/sensor.ttl'
"

test_done

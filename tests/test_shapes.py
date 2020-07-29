#test
import os
import pytest
import filecmp
import copy
import shutil
from build_shapes import build_shapes
import pyshacl

bs = build_shapes()

# remove temp files
def setup_module(module):
    print("Collect shapes")
    bs.build_shapes()
    assert os.path.exists('shacl_shapes.ttl')

def test_shape(module):
    #result = bs.test_instance("test")
    #print("res", result)
    assert bs.test_instance("test")

# remove temp files
#def teardown_module(module):
    # if os.path.exists('shapes.ttl'):
    #     shutil.rmtree('shapes.ttl')
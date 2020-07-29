# test

import os
import fnmatch
import rdflib
import shutil

# PySHACL
from pyshacl import validate

class build_shapes:

    # create Graph
    g_shape = rdflib.Graph()
    g_ontology = rdflib.Graph()

    def build_shapes(self):
        graph_file_format = 'ttl'
        shacl_filename = '*shape.ttl'
        ontology_filename = 'ontology.ttl'
        my_host_name = 'http://ld.landrs.org'
        output_shape_file = 'shacl_shapes.ttl'

        # remove old file
        if os.path.exists(output_shape_file):
            os.remove(output_shape_file)


        # get the list of files
        files_in_graph_folder = os.walk('./')
        print("Folder provided for import.")
        # loop
        for (dirpath, dirnames, filenames) in files_in_graph_folder:
            for file in filenames:
                file_path = os.path.join(dirpath, file)
                # each file if turtle
                if os.path.splitext(file_path)[-1].lower() == "." + graph_file_format:
                    if os.path.isfile(file_path):
                        print("file", file_path)
                        # load the individual file
                        try:
                            # test for shacl files, seperate graph
                            if fnmatch.fnmatch(os.path.basename(file_path), shacl_filename):
                                self.g_shape.load(
                                    file_path, format=graph_file_format, publicID=my_host_name)
                            elif fnmatch.fnmatch(os.path.basename(file_path), ontology_filename):
                                self.g_ontology.load(
                                    file_path, format=graph_file_format, publicID=my_host_name)
                            # else:
                            #     self.g1.load(
                            #         file_path, format=graph_file_format, publicID=self.my_host_name)
                        except Exception as ex:
                            print("Could not load graph file: " + str(ex))

        # save graph
        self.g_shape.serialize(destination=output_shape_file, format='turtle')

    def test_instance(self, dat):
        graph_file_format = 'ttl'
        shacl_filename = '*shape.ttl'
        ontology_filename = 'ontology.ttl'
        my_host_name = 'http://ld.landrs.org'
        output_shape_file = 'shacl_shapes.ttl'

        try:
            graph_file = 'drone/drone.ttl'
            gin = rdflib.Graph()
            gin.load(graph_file, format=graph_file_format, publicID=my_host_name)

            #r = validate(gin, shacl_graph='../landrsOntTest_full/sensor/sensor_shape.ttl', ont_graph=self.g1, inference='rdfs', abort_on_error=False, meta_shacl=False, advanced=False, debug=False)
            r = validate(gin, shacl_graph=self.g_shape, ont_graph=self.g_ontology) #, inference='rdfs', abort_on_error=False, meta_shacl=False, advanced=False, debug=False)
            conforms, results_graph, results_text = r

            print("Conforms", conforms)
            print("Graph", results_text)
        except Exception as ex:
            conforms = False
            results_text = str(ex)
            print("error")

        return conforms



# run if main ##################################################################
if __name__ == "__main__":
    bs = build_shapes()
    bs.build_shapes()

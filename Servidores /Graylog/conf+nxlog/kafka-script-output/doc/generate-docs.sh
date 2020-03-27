#!/bin/sh 
# Generate HTML format
asciidoctor kafka-perl-python-output.adoc
# Generate PDF format
asciidoctor-pdf kafka-perl-python-output.adoc

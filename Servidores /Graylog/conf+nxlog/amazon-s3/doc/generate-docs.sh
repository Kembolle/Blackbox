#!/bin/sh 
# Generate HTML format
asciidoctor amazon-s3.adoc
# Generate PDF format
asciidoctor-pdf amazon-s3.adoc

#!/bin/sh 
# Generate HTML format
asciidoctor mongodb-perl-input.adoc
# Generate PDF format
asciidoctor-pdf mongodb-perl-input.adoc

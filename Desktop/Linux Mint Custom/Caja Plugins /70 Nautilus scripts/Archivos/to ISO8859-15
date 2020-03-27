#!/bin/bash

TO_ENC="iso-8859-7"
FROM_ENC="utf-8"

for i in "$@" ; do
       iconv -t ${TO_ENC} -f ${FROM_ENC} "${i}" > "${i}.iso-8859-7"
       mv "${i}.iso-8859-7" "${i}"
done

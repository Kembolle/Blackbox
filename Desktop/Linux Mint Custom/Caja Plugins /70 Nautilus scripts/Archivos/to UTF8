#!/bin/bash

FROM_ENC="iso-8859-7"
TO_ENC="utf-8"

for i in "$@" ; do
       iconv -f ${FROM_ENC} -t ${TO_ENC} "${i}" > "${i}.utf8"
       mv "${i}.utf8" "${i}"
done

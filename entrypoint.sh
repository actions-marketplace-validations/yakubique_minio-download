#!/bin/sh -l

export PATH=$PATH:$HOME/minio-binaries/

insecure_option=""
if [[ "$YA_INSECURE" == "true" ]]; then
  insecure_option="--insecure"
fi

recursive_option=""
if [[ "$YA_RECURSIVE" == "true" ]]; then
  recursive_option="--recursive"
fi

mc alias set ${insecure_option:+"$insecure_option"} target "$YA_ENDPOINT" "$YA_ACCESS_KEY" "$YA_SECRET_KEY"
mc ${insecure_option:+"$insecure_option"} cp ${recursive_option:+"$recursive_option"} "target/$1" $2
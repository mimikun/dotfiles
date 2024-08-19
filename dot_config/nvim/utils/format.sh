#!/bin/bash

current_dir=$(pwd)

run_shfmt() {
    shfmt ./"$1" >./fmt-"$1"
    mv ./fmt-"$1" ./"$1"
    chmod +x ./"$1"
}

cd utils || exit
run_shfmt benchmark.sh
run_shfmt changelog.sh
run_shfmt clean.sh
run_shfmt create-patch.sh
run_shfmt env-reset.sh
run_shfmt format.sh
run_shfmt lint.sh
cd "$current_dir" || exit

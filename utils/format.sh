#!/bin/bash

current_dir=$(pwd)

run_shfmt() {
    shfmt ./"$1" >./fmt-"$1"
    mv ./fmt-"$1" ./"$1"
    chmod +x ./"$1"
}

cd utils || exit
run_shfmt clean.sh
run_shfmt create-patch.sh
run_shfmt format.sh
run_shfmt lint.sh
run_shfmt update.sh
run_shfmt install-skk-jisyo.sh
run_shfmt benchmark.sh
cd "$current_dir" || exit

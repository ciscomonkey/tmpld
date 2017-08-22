#!/usr/bin/env bash

find tmpld -type f -name '*.py' -exec sed -i 's/ 2016 / 2017 /g' {} \;


find tmpld -type f -name '*.py' -exec cat {} \;

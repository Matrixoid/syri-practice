#!/bin/bash

set -e

source "scripts/check_conda.sh"
source "scripts/create_environment.sh"
source "scripts/prepare_genomes.sh"
source "scripts/alignment_and_syri.sh"
source "scripts/cleanup.sh"

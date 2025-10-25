#!/bin/bash

set -e

source "check_conda.sh"
source "create_environment.sh"
source "prepare_genomes.sh"
source "alignment_and_syri.sh"
source "cleanup.sh"

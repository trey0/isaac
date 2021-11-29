#!/bin/bash
#
# Copyright (c) 2021, United States Government, as represented by the
# Administrator of the National Aeronautics and Space Administration.
#
# All rights reserved.
#
# The "ISAAC - Integrated System for Autonomous and Adaptive Caretaking
# platform" software is licensed under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with the
# License. You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# Print the software versions on the MLP, LLP, and HLP.

if [ `hostname` != mlp ] ; then
    echo "Must be run on mlp."
    exit 1
fi

DIR=$(dirname "$(readlink -f "$0")")

echo "=================== MLP ==================="
$DIR/cpu_print_version.sh | sed 's/^/  /'

echo "=================== LLP ==================="
ssh llp /opt/isaac/lib/isaac/cpu_print_version.sh | sed 's/^/  /'

echo "=================== HLP ==================="

$DIR/apk_print_version.sh | sed 's/versionName=/  /'
  


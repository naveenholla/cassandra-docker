#!/bin/sh
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

VERSION="5.1.2"
SHA1="f49e48637ac9105fefc36b79981c694f284acb64"
TARBALL="opscenter-${VERSION}.tar.gz"
URL="http://downloads.datastax.com/community/${TARBALL}"

cd /

set -e
set -x

# download the tarball from Datastax
# verify the checksum
# untar in /opt, cleanup, symlink to /opt/opscenter

echo "${SHA1} ${TARBALL}" > ${TARBALL}.sha1

if [ ! -f ${TARBALL} ]; then 
  curl -O -s ${URL}
fi

sha1sum --check ${TARBALL}.sha1

tar -xzf ${TARBALL} -C /opt

rm -f ${TARBALL} ${TARBALL}.sha1

ln -s /opt/opscenter-$VERSION /opt/opscenter

rm -f $0

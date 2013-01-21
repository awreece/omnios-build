#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2013 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=xmlstarlet      # App name
VER=1.4.2            # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG="omniti/editor/xmlstarlet"            # Package name (e.g. library/foo)
SUMMARY="XML stream editor"      # One-liner, must be filled in
DESC="Provides grep/sed/calc-like capabilities for XML files using xpath"         # Longer description, must be filled in

BUILD_DEPENDS_IPS="library/libxml2" 
DEPENDS_IPS="library/libxml2" 


# http://voxel.dl.sourceforge.net/project/xmlstar/xmlstarlet/1.4.2/xmlstarlet-1.4.2.tar.gz
MIRROR=voxel.dl.sourceforge.net
DLDIR=project/xmlstar/xmlstarlet/$VER

# Don't care about 32-bit
BUILDARCH="64"

# You'd think it would pick this up itself.
CFLAGS=`/usr/bin/xml2-config --cflags`

init
download_source $DLDIR $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
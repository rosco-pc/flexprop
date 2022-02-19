#!/usr/bin/env wish
#
# Simple GUI for Spin
# Copyright 2018-2021 Total Spectrum Software
# Distributed under the terms of the MIT license;
# see License.txt for details.
#
# Top level program

variable myScript [file normalize [info script]]
variable ROOTDIR [file dirname $myScript]
if { [file tail $ROOTDIR] eq "src" } {
    set ROOTDIR [string range $ROOTDIR 0 [string length $ROOTDIR]-5]
}
package require Tk
#package require autoscroll
#package require ctext

source $ROOTDIR/src/version.tcl
source $ROOTDIR/src/autoscroll.tcl
source $ROOTDIR/src/browser.tcl
source $ROOTDIR/src/ctext/ctext.tcl
source $ROOTDIR/src/checkserial.tcl
source $ROOTDIR/src/pathbox.tcl
source $ROOTDIR/src/fontchooser.tcl
source $ROOTDIR/src/balloon.tcl
source $ROOTDIR/src/debugwin.tcl
source $ROOTDIR/src/tkterm.tcl
source $ROOTDIR/src/ipval.tcl
source $ROOTDIR/src/gui.tcl

namespace import ::choosefont::choosefont

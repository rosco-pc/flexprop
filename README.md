# Introduction

FlexGUI is a simple GUI for running applications on the Parallax Propeller 1 or 2, using the Spin language (and now BASIC and C as well). It consists of a very basic front end IDE, the fastspin compiler, and Dave Hein's loadp2 program loader. The default configuration is for the Prop2, but I've also included David Betz's proploader.exe, which allows flexgui to work on Propeller 1 systems as well.

To install, download the flexgui.zip file from the releases. The latest release is always located at:

   https://github.com/totalspectrum/flexgui/releases/latest
   
To use it, create a directory called "flexgui" (or whatever you'd like) and unpack the .zip file into that directory. Then run flexgui.exe. The program will save its configuration in a file called .flexgui.config in that directory.

FlexGUI is distributed under the MIT license; see the file License.txt for details.

# Usage

Run flexgui.exe. Use the `File` menu to open a Spin or BASIC file. You may open multiple files. The one that is currently selected will be treated as the top level project if you try to compile and/or run. The commands used for compiling or running are settable from the `Commands > Configure Commands...` menu item. Compiling and running on Prop2 is the main focus, but you can configure for virtually any situation where just one file is compiled. So for example it should be feasible to use this GUI for `p2gcc` with a bit of tweaking.

Also under the `File` menu is an option for viewing the listing file. This will only be useful after a program is compiled.

To change between P1 and P2 development use `Configure Commands...` and select the appropriate default.

## Other platforms

Only a Windows binary is provided. For other platforms, run the `flexgui.tcl` script. You will need Tcl/Tk installed, but it is available for most versions of Unix (including Mac OS X).

## Modifying the GUI

The scripts used are in the `src` subdirectory, so you can customize them to your heart's content. The main `flexgui.exe` program is basically just the Tcl/Tk interpreter (from the standard Tk distribution) with a tiny startup script that reads `src/gui.tcl`.

# Features

* Supports PASM, Spin, BASIC, and C
* View output PASM code
* Built in terminal emulator
* Options for interacting with P2 ROM 

## High level languages

The main advantage of flexgui over PNut (the "official" development tool for the Prop2) is that PNut doesn't yet support a high level language, whereas flexgui supports Spin, BASIC, and C. You can basically write ordinary Spin code, with Prop2 assembly code in the DAT section (instead of Prop1 assembly code). This makes prototyping your applications much easier.

The code is compiled to P2 assembler by fastspin. This is somewhat different from the way Spin traditionally on the Prop1, where Spin code is typically compiled to bytecode and interpreted. (Note that fastspin does work for Prop1, and compiles to P1 assembler in that case.)

Documentation for the various languages supported is in the `doc` folder of the unpacked flexgui. BASIC is the best documented. The Spin documentation assumes familiarity with the original (Propeller1) Spin manual, and outlines the differences in the language fastspin accepts. The C documentation is a placeholder for now and mostly covers the fastspin specific extensions to C.

### Library Directories

Under the `File` menu is an option to set library directories. The compiler will automatically look through these directories for OBJ files (Spin) or `#include` files (C).

## Listing files

Under the `File` menu is an option for viewing the listing file, which shows the PASM and binary generated by fastspin from your high level language. This file may only be opened after the first compilation is done; if you try to open before doing any compile you may get an "Error: could not read" dialog box.

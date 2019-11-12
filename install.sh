#!/bin/sh

set -ex

lib_dir="$HOME/.local/share/OpenSCAD/libraries/"

mkdir -p "$lib_dir"
ln -s "$PWD" "$lib_dir/SCAD_Lib"

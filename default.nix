{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs;

mkDerivation {
  buildInputs = [
    hugo
  ];
}

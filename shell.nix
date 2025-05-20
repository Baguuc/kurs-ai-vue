{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [
    pkgs.nodejs
    pkgs.rustc
    pkgs.cargo
    pkgs.gcc
  ];
}

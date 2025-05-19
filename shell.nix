{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  packages = [
    pkgs.nodejs
    pkgs.zsh
    pkgs.zellij
    pkgs.rustc
    pkgs.cargo
  ];
  shellHook = "${pkgs.zsh}/bin/zsh -c 'export PATH=$PATH:$HOME/.cargo/bin && ${pkgs.zellij}/bin/zellij options --no-pane-frames'";
}

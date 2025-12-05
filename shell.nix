let
  rust_overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
in
with pkgs;
mkShell {

    SHADERC_LIB_DIR = "${lib.getLib shaderc}/lib";

  nativeBuildInputs = [
    autoPatchelfHook
    pkgconf
  ];

  
  runtimeDependencies = [
    libglvnd
    vulkan-loader
  ];

  buildInputs = [
    libGL
    xkeyboard_config
    libgbm
    pango
    udev
    libinput
    shaderc
    rust-bin.stable.latest.default
        libglvnd
    vulkan-loader
    autoPatchelfHook
    pkgconf

  ];

  shellHooks = ''export SHADERC_LIB_DIR="${lib.getLib shaderc}/lib"'';
}

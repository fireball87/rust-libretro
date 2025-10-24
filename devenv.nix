{ pkgs, lib, config, inputs, ... }:

{
    languages.rust.enable = true;
    cachix.enable = false;
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
                rustPlatform.rustcSrc
                pkg-config
               cmake
               stdenv.cc.cc
               freetype
               expat
                llvmPackages_21.clang-unwrapped.lib
               # Audio
               alsa-lib

               # Graphics / windowing (X11 + GL + Wayland, fairly broad to cover most setups)
               libGL
               mesa
               wayland
               libxkbcommon
               udev
               xorg.libX11
               xorg.libXext
               xorg.libXrandr
               xorg.libXcursor
               xorg.libXi
               xorg.libXinerama
               xorg.libXxf86vm

               vulkan-headers
               vulkan-loader
               vulkan-tools
               shaderc
               openssl
   ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.dev.exec = "${lib.getExe pkgs.watchexec} -n -- ls -la";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''

              # Ensure libstdc++.so.6 and other runtime libs are found when dlopening external cores
              export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [
                pkgs.stdenv.cc.cc.lib
                pkgs.alsa-lib
                pkgs.libGL
                pkgs.mesa
                pkgs.wayland
                pkgs.libxkbcommon
                pkgs.udev
                pkgs.xorg.libX11
                pkgs.xorg.libXext
                pkgs.xorg.libXrandr
                pkgs.xorg.libXcursor
                pkgs.xorg.libXi
                pkgs.xorg.libXinerama
                pkgs.xorg.libXxf86vm
                pkgs.vulkan-loader
              ]}:$LD_LIBRARY_PATH"

              export LIBCLANG_PATH="${pkgs.llvmPackages_21.clang-unwrapped.lib}/lib";
              ]}/"


    hello         # Run scripts directly
    git --version # Use packages
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}

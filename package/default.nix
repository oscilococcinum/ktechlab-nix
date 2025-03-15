{
  stdenv,
  lib,
  fetchurl,
  qt5,
  cmake,
  extra-cmake-modules,
  plasma5Packages,
  pname,
  version,
  src
}:
stdenv.mkDerivation {
  inherit src pname version;

  buildInputs = [
    qt5.qtbase
  ] ++ (with plasma5Packages.kdeFrameworks; [ 
    plasma-framework
    khtml
    kparts
    ktexteditor
  ]);

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    qt5.wrapQtAppsHook
  ];
}

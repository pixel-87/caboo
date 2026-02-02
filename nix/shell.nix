{
  callPackage,
  mkShellNoCC,

  python3,
  uv,
  ruff,
  pyright,
}:
let
  defaultPackage = callPackage ./default.nix { };
in
mkShellNoCC {
  packages = [
  (python3.withPackages (ps: defaultPackage.propagatedBuildInputs))
  ruff
  uv
  pyright
  ];
}

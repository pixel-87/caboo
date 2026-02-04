{
  callPackage,
  mkShellNoCC,

  python3,
  uv,
  ruff,
  ty,
}:
let
  defaultPackage = callPackage ./default.nix { };
in
mkShellNoCC {
  packages = [
  (python3.withPackages (ps: defaultPackage.propagatedBuildInputs))
  ruff
  uv
  ty
  ];
}

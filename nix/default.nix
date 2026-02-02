{
  lib,
  python3Packages,
  version ? "unstable",
}:
let
  inherit (python3Packages) pytestCheckHook setuptools buildPythonApplication;
in
buildPythonApplication {
  pname = "caboo";
  inherit version;

  src = lib.cleanSource ../.;

  pyproject = true;
  build-system = [ setuptools ];

  dependencies = [
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Caboo TUI game";
    homepage = "https://github.com/pixel-87/caboo";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ pixel-87 ];
    mainProgram = "caboo";
  };
}

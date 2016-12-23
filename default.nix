{ nixpkgs ? (builtins.fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/1dd0fb6b5a7c44d1b632466f936ca74268d13298.tar.gz") }:
with import nixpkgs {}; 
rec {
  runner = callPackage ./runner {};
  runner-image = dockerTools.buildImage {
    name = "weaveworksdemos/e2etests-runner";
    contents = runner;
    config = {
      Entrypoint = [ "${runner}/bin/e2etest"];
    };
  };

  e2etest-image = let
    tests = ./tests;
  in
    dockerTools.buildImage {
    name = "weaveworksdemos/e2etests";
    contents = runner;
    config = {
      WorkingDir = "${tests}";
      Entrypoint = [ "${runner}/bin/e2etest"];
      Cmd = with builtins; attrNames (readDir ./tests);
    };
  };
}

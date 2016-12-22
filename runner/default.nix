{ ruby, bundlerEnv, stdenv, runCommand, phantomjs }:
let
  env = bundlerEnv {
    name = "e2e-ruby-env";
    inherit ruby;
    propagatedBuildInputs = [ phantomjs ];
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };

  runner = stdenv.mkDerivation {
    name = "e2etest";
    phases = "installPhase";
    installPhase = ''
      mkdir -p $out/bin
      echo "export PATH=\$PATH:${phantomjs}/bin; ${env}/bin/bundle exec ${./bin/e2etest} \$@" > $out/bin/e2etest;
      chmod +x $out/bin/e2etest
    '';
  };

  mkReport = file: 
   runCommand 
     "make-e2e-report" 
     { }
     "${runner}/bin/e2etest ${file} 2>&1 > $out";
in {
  inherit runner;
  inherit mkReport;
}

{ bash, ruby, bundlerEnv, phantomjs, writeScriptBin }:
let
  env = bundlerEnv {
    name = "e2e-ruby-env";
    inherit ruby;
    propagatedBuildInputs = [ phantomjs ];
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in
writeScriptBin
  "e2etest"
  ''
  #!/${bash}/bin/bash
  export PATH=$PATH:${phantomjs}/bin
  ${env}/bin/bundle exec ${./bin/e2etest} $@
  ''

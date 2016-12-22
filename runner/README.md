#e2e test runner


## Updating gems
1. Regenerate Gemfile.lock: `$(nix-build '<nixpkgs>' -A bundler)/bin/bundler lock`
2. Generate nix expressions: `$(nix-build '<nixpkgs>' -A bundix)/bin/bundix`
3. Done :)

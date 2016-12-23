# End-to-end tests for the Socks shop.
[![Build Status](https://travis-ci.org/microservices-demo/e2e-tests.svg?branch=master)](https://travis-ci.org/microservices-demo/e2e-tests)

This repo contains a a set of end-to-end tests, that we use to verify that changes to the shop
don't cause regressions.

Futhermore, it can be used to verify that swapping out a service (lets say the `payment` service)
by one implemented in a different language, that things still work as intended.

## Building test runner
The test runner can be build using `nix-build`, or via a Docker container.

## Running tests
1. Start the socks app with docker compose
2. Run
```
URL=localhost $(nix-build)/bin/e2etest tests/add_holy_to_cart.rb test/checkout_holy.rb
```

## TODO
- [ ] Port runner to a Dockerfile

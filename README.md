# End-to-end tests for the Socks shop.
[![Build Status](https://travis-ci.org/microservices-demo/e2e-tests.svg?branch=master)](https://travis-ci.org/microservices-demo/e2e-tests)

This repo contains a a set of end-to-end tests, that we use to verify that changes to the shop
don't cause regressions.

Futhermore, it can be used to verify that swapping out a service (lets say the `payment` service)
by one implemented in a different language, that things still work as intended.

## How to run these tests
By running the following command, all tests in [the tests directory](./tests/) will be run:
```
docker build -t weaveworksdemos/e2etests .
docker run --rm -e URL=<HOSTNAME> weaveworksdemos/e2etests
```

If you want to run only the `login` and `add_holy_to_cart` tests, run:
```
docker run --rm -e URL=<HOSTNAME> weaveworksdemos/e2etests login.rb add_holy_to_cart.rb
```

## Building test runner
The test runner can be build using `nix-build`.
```
URL=localhost $(nix-build)/bin/e2etest tests/add_holy_to_cart.rb test/checkout_holy.rb
```

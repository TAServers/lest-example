# Simple example repo for Lest

This repo is a simple example of how to use the Lest testing framework, which you can find at https://github.com/TAServers/lest.

The program itself simply prints the sum of 1 and 2 to console.

Run the tests locally by downloading the latest release bundle for Lest and running `lua lest.lua` from the project directory. You can run it with a working directory elsewhere, but you will need to manually set the config path when invoking Lest and update the config to match the tests correctly.

## Structure

- `.github/workflows/test.yml` - GitHub workflow which tests the program on commit using the Lest GitHub Action
- `src/` - The source code for the program
  - `main.lua` - Entrypoint of the program
  - `main.test.lua` - Unit tests for `main.lua`. Showcases module and function mocking
  - `sum.lua` - Dependency of `main.lua` that exports a function which returns the sum of two numbers
  - `sum.test.lua` - Unit tests for `sum.lua`. Very simple example of unit testing with no mocking.
- `tests/` - Tests for the program that don't specifically relate to a single source file (integration, end to end etc.). A convention and not a requirement of Lest
  - `integration.test.lua` - Simple integration test of the whole program
- `.gitignore` - Used to ignore a local copy of Lest in this instance
- `lest.config.lua` - Contains configuration options for Lest,

{
  description = "A project with a devshell.";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/*.tar.gz";
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshell.flakeModule
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule

      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        packages.default = pkgs.hello;
        devshells.default = {
          env = [
              # { name = "MY_ENV_VAR"; value = "SOTRUE"; }
          ];
          packages = [
            pkgs.racket
            pkgs.nodejs_22
          ];
          devshell.startup = {
            install-langserver.text = ''raco pkg install --auto --skip-installed racket-langserver'';
            install-pollen.text = ''raco pkg install --auto --skip-installed pollen'';
            install-node-deps.text = ''npm install'';
          };
          commands = [
            { name = "run"; command = "npm run dev"; help = "Run everything: The pollen web server & unocss in file watching mode"; }
          ];
        };
      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.

      };
    };
}

{
	description = "Nix Flake for a TypeScript project";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs"; # Adjust the nixpkgs version as needed
	};

	outputs = { self, nixpkgs }: {
		packages.x86_64-linux = let
			pkgs = import nixpkgs {
				system = "x86_64-linux"; # Change based on your platform
			};
		in {
			# Package definition for building the project
			default = pkgs.stdenv.mkDerivation {
				pname = "typescript-project";
				version = "0.1.0";

				src = ./.;

				buildInputs = [
					pkgs.nodejs # Node.js runtime
					pkgs.typescript # TypeScript compiler
				];

				buildPhase = ''
					npm install
					npm run build
				'';

				installPhase = ''
					mkdir -p $out
					cp -r dist/* $out
				'';

				meta = with pkgs.lib; {
					description = "A TypeScript project built with Nix";
					license = licenses.gpl3;
					maintainers = with maintainers; [ example ];
				};
			};
		};

		devShells.x86_64-linux = let
			pkgs = import nixpkgs {
				system = "x86_64-linux"; # Change based on your platform
			};
		in {
			default = pkgs.mkShell {
				buildInputs = [
					pkgs.nodejs # Node.js runtime
					pkgs.typescript # TypeScript compiler
					# pkgs.yarn # Yarn package manager (optional)
				];

				shellHook = ''
					echo "Welcome to the TypeScript project development shell!"
				'';
			};
		};
	};
}

default: build

build:
	./rebuild.sh
server:
	nixos-rebuild --sudo --flake .#coffee-server --target-host coffee-server switch
vm:
	nixos-rebuild --sudo --flake .#coffee-vm build-vm
test:
	nixos-rebuild --flake .#coffee-maker dry-build
	nixos-rebuild --flake .#coffee-pot dry-build
	nixos-rebuild --flake .#coffee-bean dry-build
	nixos-rebuild --flake .#coffee-server dry-build


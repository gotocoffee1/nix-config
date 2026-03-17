build:
	./rebuild.sh
vm:
	nixos-rebuild --sudo --flake .#coffee-vm build-vm


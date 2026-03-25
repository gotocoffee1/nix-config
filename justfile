default: build

build HOST=`hostname`:
	nixos-rebuild --sudo --flake .#{{ HOST }} --target-host {{ HOST }} switch
vm:
	nixos-rebuild --flake .#coffee-grinder build-vm
boot-image:
	nixos-rebuild --image-variant raw-efi --flake .#coffee-grounds build-image 

test HOST=`hostname`:
	nixos-rebuild --flake .#{{ HOST }} dry-build

[parallel]
test-all:                       \
	(test "coffee-maker")   \
	(test "coffee-pot")     \
	(test "coffee-bean")    \
	(test "coffee-server")  \
	#(test "coffee-grinder") \
	#(test "coffee-grounds") \


default: build

build HOST=`hostname`:
	nixos-rebuild --sudo --ask-sudo-password --flake .#{{ HOST }} --target-host {{ HOST }} switch

deploy HOST_CONFIG IP:
	nixos-anywhere --flake .#{{ HOST_CONFIG }}' --target-host {{ IP }}

image HOST TYPE: 
	nixos-rebuild --image-variant {{ TYPE }} --flake .#{{ HOST }} build-image 

server: (image "coffee-server" "sd-card")
#sudo zstd -c -d result/sd-image/*.zst | dd bs=4M of=/dev/sda

boot-image: (image "coffee-grounds" "raw-efi")

vm:
	nixos-rebuild --flake .#coffee-grinder build-vm

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


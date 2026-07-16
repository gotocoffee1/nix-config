default: build

build HOST=`hostname`:
	nixos-rebuild --sudo --ask-sudo-password --flake .#{{ HOST }} --target-host {{ HOST }} switch

set unstable
user(HOST, MAP) := shell(f'nix eval --raw .#nixosConfigurations.{{ HOST }}.config.users.users --apply "(u: builtins.concatStringsSep \" \" (builtins.map ({{ MAP }}) (builtins.filter (x: x.isNormalUser) (builtins.attrValues u))))"')

deploy HOST IP:
	./modules/extra/files.sh {{ user(HOST, 'x: x.name') }}
	nixos-anywhere --flake .#{{ HOST }} --extra-files extra_root {{ user(HOST, 'x: \"--chown \${x.home} \${toString(x.uid)}:100\"') }} --target-host {{ IP }}
	rm -rf extra_root

image HOST TYPE: 
	nixos-rebuild --image-variant {{ TYPE }} --flake .#{{ HOST }} build-image 

vm HOST=`hostname`:
	nixos-rebuild --flake .#{{ HOST }} build-vm

run-vm HOST=`hostname` SSH="vm": (vm HOST)
	sleep 10 && kitty ssh {{ SSH }} &
	./result/bin/run-{{ HOST }}-vm

test HOST=`hostname`:
	nixos-rebuild --flake .#{{ HOST }} dry-build
#######
server: (image "coffee-server" "sd-card")
#sudo zstd -c -d result/sd-image/*.zst | dd bs=4M of=/dev/sda

run-devel: (run-vm "coffee-grinder" "devel")

boot-image: (image "coffee-grounds" "raw-efi")

[parallel]
test-all:                       \
	(test "coffee-maker")   \
	(test "coffee-pot")     \
	(test "coffee-bean")    \
	(test "coffee-server")  \
	#(test "coffee-grinder") \
	#(test "coffee-grounds") \


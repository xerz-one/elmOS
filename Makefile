target/i386-elmos-none/release/elmos.img: $(wildcard src/*)
	cargo build --release
	objcopy -O binary target/i386-elmos-none/release/elmos target/i386-elmos-none/release/elmos.img
	echo 1FE:55AA | xxd -r - target/i386-elmos-none/release/elmos.img

run: target/i386-elmos-none/release/elmos.img
	qemu-system-i386 -fda target/i386-elmos-none/release/elmos.img

clean:
	rm -f target/i386-elmos-none/release/elmos.img
	cargo clean --release

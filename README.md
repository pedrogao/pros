# pros

> simple risc-v operating system implement by Rust!

## run

```sh
$ rust-objcopy --strip-all target/riscv64gc-unknown-none-elf/release/pros \
-O binary target/riscv64gc-unknown-none-elf/release/pros.bin

$ qemu-system-riscv64 \
    -machine virt \
    -nographic \
    -bios ./bootloader/rustsbi-qemu.bin \
    -device loader,file=target/riscv64gc-unknown-none-elf/release/pros.bin,addr=0x80200000
```

detail information: https://rcore-os.github.io/rCore-Tutorial-Book-v3/chapter1/3first-instruction-in-kernel1.html

## notes

### ch1

- RustSBI
- stdout(print)
- Hello World
- panic handler
- call stack
- startup(0x1000) -> bootloader -> kernal(rust_main)
- log level, info, warn, error ...
- [ANSI escape sequences](https://zh.wikipedia.org/wiki/ANSI%E8%BD%AC%E4%B9%89%E5%BA%8F%E5%88%97)

## references

- https://github.com/rcore-os/rCore-Tutorial-v3
- https://rcore-os.github.io/rCore-Tutorial-Book-v3/index.html

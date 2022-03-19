# entry.asm 
    .section .text.entry
    .global _start
_start:
    la sp, boot_stack_top  # 栈顶为高地址
    call rust_main

    .section .bss.stack    # 栈
    .global boot_stack
boot_stack:
    .space 4096 * 16
    .global boot_stack_top
boot_stack_top:
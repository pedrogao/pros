OUTPUT_ARCH(riscv)
ENTRY(_start)
BASE_ADDRESS = 0x80200000; # 内核映射物理地址

SECTIONS
{
    . = BASE_ADDRESS;
    skernel = .;

    stext = .;           # start text
    .text : {
        *(.text.entry)   # .entry 代码段在最前面
        *(.text .text.*)
    }

    . = ALIGN(4K);
    etext = .;           # end text
    srodata = .;         # start read only data
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    . = ALIGN(4K);
    erodata = .;
    sdata = .;
    .data : {
        *(.data .data.*)
        *(.sdata .sdata.*)
    }

    . = ALIGN(4K);
    edata = .;
    .bss : {
        *(.bss.stack)
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }

    . = ALIGN(4K);
    ebss = .;
    ekernel = .;

    /DISCARD/ : {
        *(.eh_frame)
    }
}
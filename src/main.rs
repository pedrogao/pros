#![no_std]
#![no_main]
#![feature(panic_info_message)]

#[macro_use]
mod console;
mod lang_items;
mod sbi;

use core::arch::global_asm;
global_asm!(include_str!("entry.asm"));

#[no_mangle]
pub fn rust_main() -> ! {
    clear_bbs(); // bbs数据段清零
    info!("Hello World!");
    panic!("Shutdown machine!");
}

fn clear_bbs() {
    extern "C" {
        // bss 段的开始、结束地址，见： linker.ld
        fn sbss();
        fn ebss();
    }
    (sbss as usize..ebss as usize).for_each(|a| {
        // 每个字节依次清零
        unsafe { (a as *mut u8).write_volatile(0) }
    });
}

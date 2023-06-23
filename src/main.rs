#![no_std]
#![no_main]

use core::panic::PanicInfo;
use core::slice;

#[no_mangle]
#[panic_handler]
fn panic(_: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub fn _start() -> ! {
    let vga = unsafe { slice::from_raw_parts_mut(0xb7ffe as *mut u8, 4002) };

    for n in (0..4002).step_by(2) { vga[n] = b'A'; vga[n + 1] = 0x0d; } loop {}
}

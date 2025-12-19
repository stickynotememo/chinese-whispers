use std::ffi::CStr;
use std::ffi::c_char;
use std::path::Path;
use std::fs::*;
use std::io::Write;

#[cfg(target_family = "unix")]
extern "C" {
    fn _2_c_func() -> *const c_char;
}

fn main() -> Result<(), String> {
    // Get input string
    let raw_string_pointer: *const c_char = unsafe { _2_c_func() };
    if raw_string_pointer.is_null() { return Err(String::from("pointer is null"));
    };
    let c_string = unsafe { CStr::from_ptr(raw_string_pointer) }; // SAFETY: we are assuming the
    // string is null terminated since we created it ourselves in a previous program. However, if
    // it is not, it is UB.

    let Ok(string) = c_string.to_str() else {
        return Err(String::from("string should be null terminated"))
    };
    
    let mut string = String::from(string);

    //////////////////////////////////////
    string.push_str("Hello from Rust.");

    //////////////////////////////////////
    
    let pipe_path = &Path::new("chinese_whispers_pipe");
    let mut file = File::create(pipe_path).expect("Couldn't open pipe!");
    file.write(string.as_bytes()).expect("Couldn't write to pipe!");
    Ok(())
}


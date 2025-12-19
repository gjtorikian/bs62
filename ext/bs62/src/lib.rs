extern crate core;

use base_62::base62;
use magnus::{function, Error, Object, Ruby};

#[magnus::wrap(class = "Bs62")]
struct Bs62 {}

impl Bs62 {
    pub fn perform_encode(rb_array: Vec<u8>) -> String {
        base62::encode(rb_array.as_slice())
    }
    pub fn perform_decode(rb_str: String) -> Result<Vec<u8>, Error> {
        match base62::decode(rb_str.as_str()) {
            Ok(v) => Ok(v),
            Err(e) => {
                let ruby = Ruby::get().unwrap();
                Err(magnus::Error::new(
                    ruby.exception_runtime_error(),
                    format!("Could not call decode: {:?}", e),
                ))
            }
        }
    }
}

#[magnus::init]
fn init(ruby: &Ruby) -> Result<(), Error> {
    let c_bs62 = ruby.define_class("Bs62", ruby.class_object())?;

    c_bs62.define_singleton_method("perform_encode", function!(Bs62::perform_encode, 1))?;
    c_bs62.define_singleton_method("perform_decode", function!(Bs62::perform_decode, 1))?;

    Ok(())
}

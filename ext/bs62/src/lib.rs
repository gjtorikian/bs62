extern crate core;

use base_62::base62;
use magnus::{define_class, exception, function, Error, Object};

#[magnus::wrap(class = "Bs62")]
struct Bs62 {}

impl Bs62 {
    pub fn perform_encode(rb_array: Vec<u8>) -> String {
        base62::encode(rb_array.as_slice())
    }
    pub fn perform_decode(rb_str: String) -> Result<Vec<u8>, Error> {
        match base62::decode(rb_str.as_str()) {
            Ok(v) => Ok(v),
            Err(e) => Err(magnus::Error::new(
                exception::runtime_error(),
                format!("Could not call decode: {:?}", e),
            )),
        }
    }
}

#[magnus::init]
fn init() -> Result<(), Error> {
    let c_bs62 = define_class("Bs62", magnus::class::object())?;

    c_bs62.define_singleton_method("perform_encode", function!(Bs62::perform_encode, 1))?;
    c_bs62.define_singleton_method("perform_decode", function!(Bs62::perform_decode, 1))?;

    Ok(())
}

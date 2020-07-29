wget https://github.com/harfbuzz/harfbuzz/archive/2.6.8.zip
rm -rf harfbuzz
unzip harfbuzz-2.6.8.zip
mv harfbuzz-2.6.8 harfbuzz
bindgen --no-prepend-enum-name --whitelist-function hb_.\* --whitelist-type hb_.\* harfbuzz/src/hb.h | sed 's/ f32/ ::std::os::raw::c_float/' | sed 's/u32_/u32/' | sed 's/i32_/i32/' | sed 's/u16_/u16/' | sed 's/i16_/i16/' | sed 's/u8_/u8/' | sed 's/i8_/i8/' >src/bindings.rs

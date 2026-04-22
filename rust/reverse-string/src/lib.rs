pub fn reverse(input: &str) -> String {
    let chars: Vec<char> = input.chars().collect();
    let mut reverse_string = String::new();
    for c in chars {
        let mut my_buf: [u8; 4] = [0; 4];
        let my_string: &str = c.encode_utf8(&mut my_buf);
        reverse_string.insert_str(0, my_string);
    }
    reverse_string.to_string()
}
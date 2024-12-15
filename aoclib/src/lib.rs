use std::fs;

pub fn read_input() -> String {
    fs::read_to_string("input.txt").expect("Unable to read input file")
}

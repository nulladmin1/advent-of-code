use std::fs;

pub fn read_input(day: i8) -> String {
    let day = format!("{:02}", day);
    let path = format!("inputs/day{day}.txt");
    fs::read_to_string(path).expect("Unable to read input file")
}

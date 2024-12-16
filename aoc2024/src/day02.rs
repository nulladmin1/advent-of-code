use aoclib::read_input;

fn parse_input(input: &str) -> Vec<Vec<i32>> {
    let mut array: Vec<Vec<i32>> = Vec::new();
    for line in input.lines() {
        let row: Vec<i32> = line
            .split_whitespace()
            .map(|a| a.parse::<i32>().unwrap())
            .collect();
        array.push(row);
    }
    array
}

pub fn fine_safe_levels(input: Vec<Vec<i32>>) -> i32 {
    let mut safe_levels: i32 = 0;
    let mut safe = true;

    for i in input {
        for j in 0..i.len() - 1 {
            todo!(…)
        }
        if safe {
            safe_levels += 1;
        }
    }

    safe_levels
}

pub fn run() {
    let input = read_input(2);
    let input = parse_input(&input);
    println!("To be implemented");
}

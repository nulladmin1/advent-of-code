fn main() {
    for n in 1..=25 {
        println!("Day {:02}:", n);
        match n {
            1 => aoc2024::day01::run(),
            2 => aoc2024::day02::run(),
            3 => aoc2024::day03::run(),
            4 => aoc2024::day04::run(),
            5 => aoc2024::day05::run(),
            6 => aoc2024::day06::run(),
            7 => aoc2024::day07::run(),
            8 => aoc2024::day08::run(),
            9 => aoc2024::day09::run(),
            10 => aoc2024::day10::run(),
            11 => aoc2024::day11::run(),
            12 => aoc2024::day12::run(),
            13 => aoc2024::day13::run(),
            14 => aoc2024::day14::run(),
            15 => aoc2024::day15::run(),
            16 => aoc2024::day16::run(),
            17 => aoc2024::day17::run(),
            18 => aoc2024::day18::run(),
            19 => aoc2024::day19::run(),
            20 => aoc2024::day20::run(),
            21 => aoc2024::day21::run(),
            22 => aoc2024::day22::run(),
            23 => aoc2024::day23::run(),
            24 => aoc2024::day24::run(),
            25 => aoc2024::day25::run(),
            _ => println!("To be implemented"),
        }
    }
}

use aoclib::read_input;

pub struct DoubleLists {
    left_list: Vec<u32>,
    right_list: Vec<u32>,
}

fn parse_input(input: &str) -> DoubleLists {
    let mut left_list: Vec<u32> = vec![];
    let mut right_list: Vec<u32> = vec![];

    for line in input.lines() {
        let (num1, num2) = line.split_once("   ").unwrap();
        let num1 = num1.parse::<u32>().unwrap();
        let num2 = num2.parse::<u32>().unwrap();
        left_list.push(num1);
        right_list.push(num2);
    }

    left_list.sort();
    right_list.sort();

    DoubleLists {
        left_list,
        right_list,
    }
}

fn binary_search(arr: &[u32], target: u32) -> u32 {
    let mut occurrences: u32 = 0;
    let mut low = 0;
    let mut high = arr.len();

    while low < high {
        let mid = (low + high) / 2;
        if arr[mid] == target {
            let mut left = mid;
            let mut right = mid;

            while left > 0 && arr[left - 1] == target {
                occurrences += 1;
                left -= 1;
            }

            while right < arr.len() && arr[right] == target {
                occurrences += 1;
                right += 1;
            }
            break;
        } else if arr[mid] < target {
            low = mid + 1;
        } else {
            high = mid;
        }
    }
    occurrences
}

pub fn find_total_distance(input: &DoubleLists) -> u32 {
    let mut total_distance: u32 = 0;

    for i in 0..input.left_list.len() {
        let distance = input.left_list[i].abs_diff(input.right_list[i]);
        total_distance += distance;
    }

    total_distance
}

pub fn find_similarity_score(input: &DoubleLists) -> u32 {
    let mut similarity_score: u32 = 0;
    for i in input.left_list.iter() {
        let occurrences = binary_search(&input.right_list, *i);
        similarity_score += occurrences * i;
    }
    similarity_score
}

pub fn run() {
    let input_file = read_input(1);

    let input = parse_input(&input_file);

    let part1_result = find_total_distance(&input);
    println!("Part 1 - Total Distance: {}", part1_result);

    let part2_result = find_similarity_score(&input);
    println!("Part 2 - Similarity Score: {}", part2_result);
}

open Common

let rotate_loopback current = ((current mod 100) + 100) mod 100

let rotate current direction value =
  rotate_loopback
  @@ if direction = 'L' then current - value else current + value

let zero current = if current = 0 then 1 else 0

let rec solve_helper lines current zeroes =
  match lines with
  | [] -> 0
  | x :: t ->
      let direction, value = parse_string x in
      let new_current = rotate current direction value in
      zero new_current + solve_helper t new_current zeroes

let solve lines = solve_helper lines 50 0

let () =
  let filename = Sys.argv.(1) in
  let file = openfile filename in
  Printf.printf "%d" @@ solve file

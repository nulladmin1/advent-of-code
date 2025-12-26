open Common
open Shared

let is_invalid str =
  let midpoint = String.length str / 2 in
  String.sub str 0 midpoint
  = String.sub str midpoint (String.length str - midpoint)

let rec find_invalids first last invalids =
  if first > last then invalids
  else
    let invalid = if is_invalid @@ string_of_int first then [ first ] else [] in
    find_invalids (first + 1) last (invalid @ invalids)

let rec solve_ranges ranges sum =
  match ranges with
  | [] -> sum
  | x :: xs ->
      let first, last = x in
      solve_ranges xs sum + List.fold_left ( + ) 0 (find_invalids first last [])

let solve file =
  let parsed_file = parse_file file in
  solve_ranges parsed_file 0

let () =
  let filename = Sys.argv.(1) in
  let file = openfile filename in
  Printf.printf "%d" @@ solve file

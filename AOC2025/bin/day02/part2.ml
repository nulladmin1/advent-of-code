open Common
open Shared

let is_divisible num denom = num mod denom = 0

let rec split_n str n acc =
  let len = String.length str in
  if len = 0 then List.rev acc
  else
    let head_chunk = String.sub str 0 n in
    let rest = String.sub str n (len - n) in
    split_n rest n (head_chunk :: acc)

let list_equal lst =
  match lst with [] -> true | x :: xs -> List.for_all (fun e -> e = x) xs

let rec is_invalids str len res =
  let mid = String.length str / 2 in
  if len > mid then res
  else
    let invalid =
      is_divisible (String.length str) len && (list_equal @@ split_n str len [])
    in
    is_invalids str (len + 1) (invalid || res)

let is_invalid str = is_invalids str 1 false

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

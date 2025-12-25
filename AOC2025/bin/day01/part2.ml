open Common

let rotate_mod x = ((x mod 100) + 100) mod 100

(* Yes I know for loops are disgusting but cmon iteration
  in this is better than recursion*)
let rotate current direction value =
  let position = ref current in
  let zeroes = ref 0 in

  for _ = 0 to value - 1 do
    if direction = 'L' then position := rotate_mod (!position - 1)
    else position := rotate_mod (!position + 1);
    if !position = 0 then incr zeroes
  done;

  (!zeroes, !position)

let rec solve_helper lines current =
  match lines with
  | [] -> 0
  | x :: t ->
      let direction, value = parse_string x in
      let zero, new_current = rotate current direction value in
      zero + solve_helper t new_current

let solve lines = solve_helper lines 50

let () =
  let filename = Sys.argv.(1) in
  let file = openfile filename in
  Printf.printf "%d" @@ solve file

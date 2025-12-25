let openfile file =
  try
    In_channel.with_open_text file In_channel.input_lines
  with
  | Sys_error msg ->
    prerr_endline ("Error: " ^ msg);
    []

let parse_string str =
  let num = int_of_string (String.sub str 1 (String.length str - 1)) in
  (String.get str 0, num)


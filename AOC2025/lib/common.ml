let openfile file =
  try In_channel.with_open_text file In_channel.input_lines
  with Sys_error msg ->
    prerr_endline ("Error: " ^ msg);
    []

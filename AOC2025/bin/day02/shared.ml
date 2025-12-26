let range_to_tuple range_str =
  let split = String.split_on_char '-' range_str in
  match split with
  | [ a; b ] -> (int_of_string a, int_of_string b)
  | _ -> invalid_arg "need range with 2 endpoints"

let parse_file file =
  file |> String.concat "" |> String.split_on_char ','
  |> List.map range_to_tuple

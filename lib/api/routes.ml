open Challenge  (* Direct reference to sibling module *)

let handle_challenge_request id =
  let challenge = get_by_id id in
  Printf.sprintf "Challenge: %s (Difficulty: %d)" 
    challenge.name challenge.difficulty
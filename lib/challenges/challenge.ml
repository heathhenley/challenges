type challenge = {
  id: string;
  name: string;
  difficulty: int;
}

let get_by_id id =
  (* Implementation to fetch challenge by ID *)
  {id; name = "Sample Challenge"; difficulty = 3}
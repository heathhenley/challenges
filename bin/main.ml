open Ppx_yojson_conv_lib.Yojson_conv.Primitives

type message_object = {
  message : string;
} [@@deriving yojson]

let () =
  Dream.run ~interface:"0.0.0.0" ~port:8080
  @@ Dream.logger
  @@ Dream.router (
    [
      (* default route *)
      Dream.get "/"
        (fun (_)->
          let message = { message = "Hello, World!" } in
          let json = yojson_of_message_object message in
          let json_string = Yojson.Safe.to_string json in
          Dream.json json_string
        );
      (* Get a challenge by ID *)
      Dream.get "/challenge/:id"
        (fun request ->
          let id = Dream.param request "id" in
          let challenge = Api.Routes.handle_challenge_request id in
          Printf.printf "Challenge: %s\n" challenge;
          Dream.json challenge
        );
    ]
  )
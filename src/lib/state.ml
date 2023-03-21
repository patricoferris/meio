
(* Mutable State *)
let tasks = Task_table.create ()

let add_tasks (id, domain, ts) =
  let task = Task.create ~id ~domain (Runtime_events.Timestamp.to_int64 ts) in
  Task_table.add tasks task

let remove_task i = Task_table.remove_by_id tasks i
let update_loc i id = Task_table.update_loc tasks i id
let switch_to ~id ~domain = Task_table.update_active tasks ~id ~domain

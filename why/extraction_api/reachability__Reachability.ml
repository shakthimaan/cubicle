(* This file has been generated from Why3 theory Reachability *)

open Why3
open Ast



(* replace every occurrence of [at(t,'now)] with [t] *)
let rec remove_at f =
  let open Stdlib in
  let open Ident
 in
  let open Ty
 in
  let open Term
 in
  let open Decl
 in
  let open Theory
 in
  let open Mlw_ty
 in
  let open Mlw_ty.T
 in
  let open Mlw_expr in
  match f.t_node with
  | Tapp (ls, [t; { t_node = Tapp (fs,[]) }])
    when ls_equal ls Mlw_wp.fs_at -> Term.t_true 
  | _ -> t_map remove_at f



let append_extra args tr_args =
  let rec aux acc cpt = function
    | [] -> List.rev acc
    | _::r -> aux ((List.nth proc_vars (cpt - 1)) :: acc) (cpt+1) r
  in
  aux (List.rev args) (List.length args + 1) tr_args   

(* let nargs = append_extra args tr.tr_args *)

(* proc_pv_symbol #1 ... *)


let pre_one_trans t f =
  let args = Translation.procs_of_why f in
  let nargs = append_extra args t.tr_args in
  let args_list = all_arrangements (List.length t.tr_args) nargs in
  List.fold_left (fun pre_f args ->
    let c = Mlw_wp.wp_expr Translation.env ! Translation.known_map
			   (Translation.instantiate_trans t args)
			   (Term.t_eps_close Translation.dummy_vsymbol f)
			   Mlw_ty.Mexn.empty in
    (* let c =  (remove_at c) in *)
    Term.t_or_simp c pre_f
  ) Term.t_false args_list


let pre (x: Fol__FOL.t) : Fol__FOL.t =
  (*-----------------  Begin manually edited ------------------*)
  List.fold_left (fun pre_x t -> Term.t_or_simp (pre_one_trans t x) pre_x)
		 Term.t_false (!Global.info).trans
  (*------------------  End manually edited -------------------*)

  (* ignore (Mlw_wp.wp_expr); *)
  (* let res_cubes =  *)
  (*   List.fold_left (fun acc s -> *)
  (*     let ls, post = Bwreach.pre_system s in *)
  (*     ls @ post @ acc *)
  (*   ) [] (Fol__FOL.fol_to_cubes x) *)
  (* in *)
  (* Fol__FOL.cubes_to_fol res_cubes *)




let pre_star (x: Fol__FOL.t) : Fol__FOL.t =
  failwith "to be implemented" (* uninterpreted symbol *)

let reachable (init: Fol__FOL.t) (f: Fol__FOL.t) : bool =
  (*-----------------  Begin manually edited ------------------*)
  Fol__FOL.sat (Fol__FOL.infix_et (pre_star f) init)
  (*------------------  End manually edited -------------------*)



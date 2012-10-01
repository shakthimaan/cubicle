(**************************************************************************)
(*                                                                        *)
(*                                  Cubicle                               *)
(*             Combining model checking algorithms and SMT solvers        *)
(*                                                                        *)
(*                  Sylvain Conchon and Alain Mebsout                     *)
(*                  Universite Paris-Sud 11                               *)
(*                                                                        *)
(*  Copyright 2011. This file is distributed under the terms of the       *)
(*  Apache Software License version 2.0                                   *)
(*                                                                        *)
(**************************************************************************)

open Format
open Ast

val print_term : formatter -> term -> unit

val print_atom : formatter -> Atom.t -> unit

val print_cube : formatter -> SAtom.t -> unit

val print_array : formatter -> ArrayAtom.t -> unit

val print_system : formatter -> t_system -> unit

val print_args : formatter -> Hstring.t list -> unit

val print_subst : formatter -> (Hstring.t * Hstring.t) list -> unit

val print_unsafe : formatter -> t_system -> unit

val print_node : formatter -> t_system -> unit

val print_dead_node : formatter -> (t_system * int list) -> unit

val print_verbose_node : formatter -> t_system -> unit

val syscall : string -> string

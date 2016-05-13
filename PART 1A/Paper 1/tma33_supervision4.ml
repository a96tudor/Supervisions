    (* ========================= SUPERVISION WORK ========================= *)


(* === EXERCISE 9.1 === *)

 datatype 'a seq = Nil
 			| Cons of 'a * (unit -> 'a seq);

 fun from k = Cons(k, fn() => from(k+1));

fun map f Nil = Nil
	| map f (Cons(x,xs)) = Cons(f x, fn() => map f (xs())); 

(* == TESTS == 

map (fn x => 2*x) Nil =  Nil) 
map (fn x => 2*x) (Cons(1,fn()=>Nil)) = Cons (2, fn) ) *)

(* === EXERCISE 9.3 === *)

datatype 'a SEQ = Nil1
			| Cons1 of 'a list * (unit -> 'a SEQ);

fun seqChange (Coins, CoinVals, 0, ANS) = Cons1(Coins, ANS)
 | seqChange (Coins, [], amt, ANS) = ANS()
 | seqChange (Coins, C::CoinVals, amt, ANS) =
 	if (amt<0) then ANS()
 		else 
 		 seqChange(C::Coins, C::CoinVals, amt-C, 
 		 			fn() => seqChange(Coins, CoinVals, amt, ANS));

(* == TESTS == 

if (seqChange([],[1,2,5,10,25,50],0,fn() =>Nil1) = 
	Cons1 ([], fn)) 

if (seqChange([],[1,2,5,10,25,50],49,fn() =>Nil1) = 
	Cons1
      ([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            1, 1, 1, 1],
         fn))
*)
		

(* === EXCERCISE 9.4 === *)

datatype 'a Ltree = TNill
	| Br of 'a  * (unit -> 'a Ltree) * (unit -> 'a Ltree);

fun Store TNill = []
	| Store (Br(X,Ls,Rs)) = X :: ( Store(Rs()) @ Store(Ls()));

(* == TESTS == *)



(* === EXERCISE 10.3 === *)
exception EMPTY_QUEUE
datatype 'a tree = Lf | Br of 'a * 'a tree * 'a tree 
datatype 'a queue = Q of 'a tree list * 'a tree list;
fun rev [] = [] 
| rev (x::xs) = 
	let 
		fun R [] ys = ys
		 | R (x::xs) ys = R xs (x::ys)
	in 
		R (x::xs) []
	end;
fun qhd(Q([],[])) = raise EMPTY_QUEUE | qhd(Q((x::xs),ys)) = x;
fun norm(Q([],tls)) = Q(rev(tls), []) | norm q = q;
fun qadd(Q(hds,tls),x) = norm(Q(hds,x::tls));
fun qerase(Q(x::hds,tls)) = norm(Q(hds,tls));

fun BFS (Q([],[])) = []
 | BFS q = 
 	let 
 		fun breadth Lf = BFS (qerase q)
 		 | breadth (Br(v,t,u)) = BFS(qadd(qadd(qerase q, t),u))
 	in
 		breadth (qhd q)
 	end;

(* === EXERCISE 11.1 === *)

(* MEMBERSHIP TEST *)

fun member a [] = false
  | member a (x::xs) = 
   	if (a>x) then member a (xs)
 		else if (a<x) then false
 	 		else true;

(* == TESTS == *)

if (member 2 [1,2,3]) then print "PASS\n"
	else print "FAIL\n";

if (member 2 [1,3,4]) then print "FAIL\n"
	else print "PASS\n";


(* SUBSET TEST *)

fun subset [] xs = true
 | subset (n::[]) xs = member n xs
 | subset (n::ns) xs = 
 	if (member n xs) then subset ns xs
 		else false;

(* == TESTS == *)

if (subset [1,2] [1,2,3,4]) then print "PASS\n"
	else print "FAIL\n";
if (subset [1,2] [1,3,4,5]) then print "FAIL\n"
	else print "PASS\n";

(* == UNION == *)

fun union [] [] = []
 | union Xs [] = Xs
 | union [] Ys = Ys
 | union (x::Xs) (y::Ys) = 
 	if (x<y) then x :: union Xs (y::Ys)
 		else if (x>y) then y :: union (x::Xs) Ys
 			else x :: union Xs Ys;
 (* == TESTS == *) 

 if (union [1,2,3] [3,4,5] = [1,2,3,4,5]) then print "PASS\n"	
 	else print "FAIL\n";
 if  (union [] [1,2,3] = [1,2,3]) then print "PASS\n"
 	else print "FAIL\n";

 (* INTERSECTION *)

 fun inter [] [] = []
  | inter [] ys = []
  | inter (x::xs) ys  =
  		if (member x ys) then x :: (inter xs ys)
  			else inter xs ys;

 (* TESTS *)

 if (inter [1,2,3] [3,4,5] = [3]) then print "PASS\n"	
 	else print "FAIL\n";
 if  (inter [] [1,2,3] = []) then print "PASS\n"
 	else print "FAIL\n";
  			
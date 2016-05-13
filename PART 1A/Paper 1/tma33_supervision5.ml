		(* ========= SUPERVISION WORK ============ *)
			(* === 10.11.2015 === *)

	(* === 12.2 === *)


fun power_it (x, n) = 
	let 
		val Sol = ref 1 
		val b = ref n
		val a = ref x
	in
		while (!b <> 0) do 
		(
			if (!b mod 2 = 1) then 
				( Sol := !Sol * !a; b := !b - 1 )
			else (a := !a * !a ; b := !b div 2 )
		);
		!Sol
	end;

	(* === TESTS === *)
	if ((power_it(5,2) = 25)) then print "PASS\n"
		else print "FAIL\n";
	if (power_it(3,4) = 81)  then print "PASS\n"
		else print "FAIL\n";

val a = ref 5
val b = ref 6

	(* === 12.4 === *)

fun change (x, y) = 
	let
		val n = ref (!x)
		val m = ref (!y)
	in
		(m,n)
	end;

	(* TESTS *)

(* (change (a,b) = (b,a)) 
   (change (b,a) = (a,b)) 
*)

	(* === 12.5 === *)

	(* Create *)

fun create n = 
	Array.tabulate (n, fn x => Array.tabulate(n, fn y => (x*n) + (y+1))) ;

	(* TESTS *)

(* create 2 = fromList[fromList[1, 2], fromList[3, 4]]
   create 3 = fromList[fromList[1, 2, 3], fromList[4, 5, 6], fromList[7, 8, 9]]
*)

	(* Transpose *)

fun transpose A n m = 
	Array.tabulate (n, fn x => Array.tabulate(m, fn y => Array.sub(Array.sub(A,y),x)));

	(* TESTS *)

(* transpose (create 3) 3 3 = fromList[fromList[1, 4, 7], fromList[2, 5, 8], fromList[3, 6, 9]]
   transpose (create 2) 2 2 =  fromList[fromList[1, 3], fromList[2, 4]]
*)

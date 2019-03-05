% 15-puzzle 
%
% The key predicates are move and in.
% Atom move(T,X,Y) has the meaning: at time T tile 0 is moved to
% location (X,Y) and 
% in(T,X,Y,A) is read as: at time T tile A is in location (X,Y).
% Initial configuration is given as facts in0(x,y,a). 
% 15-puzzle - 19 moves required
%
% time/1: possible time steps
% entry/1: pieces
% pos/1: x/y-dimension of board
%
% in0(X,Y,Piece): initial configuration

maxtime(3).




entry(0).
entry(1).
entry(2).
entry(3).
entry(4).
entry(5).
entry(6).
entry(7).
entry(8).
entry(9).
entry(10).
entry(11).
entry(12).
entry(13).
entry(14).
entry(15).
entry(16).
entry(17).
entry(18).
entry(19).
entry(20).
entry(21).
entry(22).
entry(23).
entry(24).
entry(25).
entry(26).
entry(27).
entry(28).
entry(29).
entry(30).
entry(31).


pos(1).
pos(2).
pos(3).
pos(4).

in0(1,1,1,16).   in0(1,2,1,1).  in0(1,3,1,2).  in0(1,4,1,3).
in0(2,1,1,4).   in0(2,2,1,5).  in0(2,3,1,6).  in0(2,4,1,7).
in0(3,1,1,8).   in0(3,2,1,9).  in0(3,3,1,10). in0(3,4,1,11).
in0(4,1,1,12).  in0(4,2,1,13). in0(4,3,1,14). in0(4,4,1,15).
in0(1,1,2,17).   in0(1,2,2,21).  in0(1,3,2,18).  in0(1,4,2,19).
in0(2,1,2,20).   in0(2,2,2,0).  in0(2,3,2,22).  in0(2,4,2,23).
in0(3,1,2,24).   in0(3,2,2,25).  in0(3,3,2,26). in0(3,4,2,27).
in0(4,1,2,28).  in0(4,2,2,29). in0(4,3,2,30). in0(4,4,2,31).

% Select where to move tile 0
move(T,X,Y,Z)  :-  maxtime(T1), T < T1,
        in(T,X1,Y,Z,0), X = X1 + 1, 
	not someothermove(T,X,Y,Z). 
move(T,X,Y,Z)  :-  maxtime(T1), T < T1,
        in(T,X,Y1,Z,0), Y = Y1 + 1, 
	not someothermove(T,X,Y,Z). 
move(T,X,Y,Z)  :-  maxtime(T1), T < T1,
        in(T,X1,Y,Z,0), X1 = X + 1, 
	not someothermove(T,X,Y,Z). 
move(T,X,Y,Z)  :- maxtime(T1), T < T1,
        in(T,X,Y1,Z,0), Y1 = Y + 1, 
	not someothermove(T,X,Y,Z). 
move(T,X,Y,Z)  :-  maxtime(T1), T < T1,
        in(T,X,Y,Z1,0), Z = Z1 + 1, 
	not someothermove(T,X,Y,Z). 
move(T,X,Y,Z)  :- maxtime(T1), T < T1,
        in(T,X,Y,Z1,0), Z1 = Z + 1, 
	not someothermove(T,X,Y,Z).

someothermove(T,X,Y,Z) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	movex(T,X1), X!=X1.
someothermove(T,X,Y,Z) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	movey(T,Y1), Y!=Y1.
someothermove(T,X,Y,Z) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	movez(T,Z1), Z!=Z1.

movex(T,X) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	move(T,X,Y,Z). 
movey(T,Y) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	move(T,X,Y,Z). 
movez(T,Z) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z),
	move(T,X,Y,Z).

% Effects of a move 
% Define the moving tile for each time T
moving(T,A) :-  maxtime(T1), T < T1, pos(X), pos(Y), pos(Z), entry(A),
        move(T,X,Y,Z), in(T,X,Y,Z,A).

% The moving tile A is moved to the location of tile 0
in(T1,X,Y,Z,A) :-  maxtime(T2), T < T2, pos(X), pos(Y), pos(Z), entry(A), 
        moving(T,A), in(T,X,Y,Z,0), T1 = T + 1. 

% Tile 0 is moved to the location (X,Y) when doing move(T,X,Y)
in(T1,X,Y,Z,0) :-  maxtime(T2), T < T2, pos(X), pos(Y), pos(Z),
	move(T,X,Y,Z), T1 = T + 1.

% Frame axiom
in(T1,X,Y,Z,A) :-  maxtime(T2), T < T2, entry(A), pos(X), pos(Y), pos(Z),
	A != 0, in(T,X,Y,Z,A), not moving(T,A), T1 = T + 1.

% Goal configuration
%  0  1  2  3
%  4  5  6  7
%  8  9 10 11
% 12 13 14 15

in_t(1,1,1,0).   in_t(1,2,1,1).   in_t(1,3,1,2).   in_t(1,4,1,3).
in_t(2,1,1,4).   in_t(2,2,1,5).   in_t(2,3,1,6).   in_t(2,4,1,7).
in_t(3,1,1,8).   in_t(3,2,1,9).   in_t(3,3,1,10).  in_t(3,4,1,11).
in_t(4,1,1,12).  in_t(4,2,1,13).  in_t(4,3,1,14).  in_t(4,4,1,15).
in_t(1,1,2,16).   in_t(1,2,2,17).   in_t(1,3,2,18).   in_t(1,4,2,19).
in_t(2,1,2,20).   in_t(2,2,2,21).   in_t(2,3,2,22).   in_t(2,4,2,23).
in_t(3,1,2,24).   in_t(3,2,2,25).   in_t(3,3,2,26).  in_t(3,4,2,27).
in_t(4,1,2,28).  in_t(4,2,2,29).  in_t(4,3,2,30).  in_t(4,4,2,31).

% Goal configuration must be satisfied
:- entry(A), pos(X), pos(Y), pos(Z), maxtime(T), in(T,X,Y,Z,A), not in_t(X,Y,Z,A). 
:- entry(A), pos(X), pos(Y), pos(Z), maxtime(T), not in(T,X,Y,Z,A), in_t(X,Y,Z,A). 

% Initial configuration
in(0,X,Y,Z,A) :- in0(X,Y,Z,A).

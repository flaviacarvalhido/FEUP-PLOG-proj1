# Nava

Resolution proposal for the first project of the Logic Programming course unit @ FEUP, a game board called [**Nava**](https://boardgamegeek.com/boardgame/250491/nava)
[Official Board and Rules](https://drive.google.com/file/d/1qfZp_uDWRPxPU5U2lN-EGNDfEHkjha1u/view).

- [Nava](#nava)
  - [Who and What](#who-and-what)
  - [Game and Rules?](#game-and-rules?)
  - [Game State Representation](#game-state-representation)
  - [Visualization of the game state](#visualization-of-the-game-state)
  - [Documentation](#documentation)

___


## Who and What

> - Prolog implementation of the NAVA board game
> - identification of the group
>   - Nava_2
>   - Practical Class 3
>   - Flávia Carvalho Gavinha Pereira Carvalhido - up201806857
>   - Tomás Costa Fontes - up 


## Game and Rules?

Nava is an abstract game, where players compete to be the first to lay all of their Cubes down on the board. They do this by moving Discs to capture rival pieces and lay Cubes to conquer junctions. For 2 players, the game board is a 4x4 square and each player has 6 Discs and 9 Cubes each. They start with all their Discs stacked in opposite corners of the board. Play is clockwise with players taking turns until someone captures all Disc stacks or lays all of their Cubes. A stack belongs to the player with their Disc at the top. On their turn, a player must take a number of discs from the top of one of their stacks and move them, along a straight line, to another junction. The distance a stack moves is the same as the number of Discs in that stack therefore, if a player takes a 2 disc stack, it can move 2 junctions. In a single move, stacks can't turn corners. If a player moves their stack onto another stack it becomes theirs, including all opponents Discs in that stack. Players can move all discs in stacks that they own, regardless of their colour. A player cannot move more than the number of junctions available. If their stack has more Discs than junctions available and they wish to move to the edge of the board, then they must split their stack. Furthermore, a player may choose to move a whole stack, (including captured opponents), or split their stack and move part of it. If a player moves their entire stack off a previously occupied junction, leaving it empty, then they place a Cube on this junction. If a player lands on a Cube, they give the Cube back to the Cube’s owner and place their stack on this junction (this includes when a player lands on thieir own Cube). If a player splits their stack then they may create an opponent-controlled stack in the process, as long as the top Disc from the resulting stack is from the opponent. If a player loses possession of all of their stacks then they are eliminated. The first player with all their Cubes on the board or the last person in the game with Disc stacks is the winner!
> - biography (such as game official's page, rules' book, etc.)


## Game State Representation

> - indication of the game state is represented, including
>   - board (tipically a list of lists with different atoms as pieces)
>   - current player
>   - eventually captured pieces or yet to play
>   - other required information (depending on the game)
> - examples of representation in Prolog (which should also be in the code file)
>   - initial game state
>   - intermediate game state
>   - final game state
> - indication of the meaning of each atom, i.e., how the pieces are represented


## Visualization of the game state

> small description about the implementation of the predicate of the game state visualization (**max 200 words**)

## Documentation

More info on Prolog documentation with PlDoc [here](https://www.swi-prolog.org/pldoc/doc_for?object=section(%27packages/pldoc.html%27)).

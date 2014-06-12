pd7-he-libman-advancedwars
==========================

Advanced Wars
Alex Libman and Jeffrey He (Period 7)
Controls:
[Map Editor]
s - save map to txt file.
z - change the side of a unit the mouse is hovering over

[Game]
Tab - open end turn menu/close any open menu
Arrow keys - scroll in menu
Enter - make menu selection

A queue was used in implementing turns and a priority queue was used in path finding. 
Hashmaps were used in tinting the sprites different colors based upon their sides. 

Note: The game has support for more than 2 players, just change the numPlayers variable in Game.pde.

Every unit has a different attack strength and range and distance on which they can travel.
Rough terrains such as mountains and trees provide extra defensive bonus to a unit, but also cost
more movement points to cross. Buildings also provide defensive bonus.
Buildings are captured by keeping a unit on top of the building until the building loses all of its HP.
After capture, factories can produce any kind of unit for a certain price, although only one unit
can be bought per factory per turn. Cities provide their owner $300 per turn each. The HQ is the lifeline
of each player. If it is captured by any other player, the player loses and is wiped off the map. It is 
important to keep one's HQ well defended. When only one player remains, he/she is the victor. 

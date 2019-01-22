# Conway's Game of Life - Ruby

Ruby version of the Game of Life in the terminal

![Animation](https://media.giphy.com/media/1etWs6I0jIMHS4Db5u/giphy.gif)

## Contents

- [Introduction](#introduction)
- [Game Rules](#game-rules)
- [Setup](#setup)

## Introduction

This is a simple program used to simulate Conway's Game of Life and was coded in an Object-Oriented fashion. It is run purely in the terminal. A `0` represents a cell that is "alive" and a `.` represents a cell that is "dead".

## Game Rules

According to [Wikipedia](#https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life):

- Any live cell with fewer than two live neighbors dies, as if by underpopulation.
- Any live cell with two or three live neighbors lives on to the next generation.
- Any live cell with more than three live neighbors dies, as if by overpopulation.
- Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

## Benchmarks

```
Branch          user       system     total     real
Mutable         3.963054   0.075831   4.041071  ( 11.562705)
Immutable       4.346693   0.078944   4.427771  ( 10.738182)
Multi-threaded  4.399532   0.086560   4.488290 ( 12.685574)
```

## Cyclomatic Complexity

```
+--------------+-------------+------------+
|             lib/commands.rb             |
+--------------+-------------+------------+
| Class/Module | Method      | Complexity |
+--------------+-------------+------------+
| Command      | *           | 0          |
| Command      | #initialize | 0          |
+--------------+-------------+------------+
+--------------+----------+------------+
|           lib/commands.rb            |
+--------------+----------+------------+
| Class/Module | Method   | Complexity |
+--------------+----------+------------+
| StartMutable | *        | 0          |
| StartMutable | #execute | 0          |
+--------------+----------+------------+
+--------------+----------+------------+
|           lib/commands.rb            |
+--------------+----------+------------+
| Class/Module | Method   | Complexity |
+--------------+----------+------------+
| StartMulti   | *        | 0          |
| StartMulti   | #execute | 0          |
+--------------+----------+------------+
+----------------+----------+------------+
|            lib/commands.rb             |
+----------------+----------+------------+
| Class/Module   | Method   | Complexity |
+----------------+----------+------------+
| StartImmutable | *        | 0          |
| StartImmutable | #execute | 0          |
+----------------+----------+------------+
+--------------+--------------------+------------+
|          lib/mutable/cell_mutable.rb           |
+--------------+--------------------+------------+
| Class/Module | Method             | Complexity |
+--------------+--------------------+------------+
| CellMutable  | *                  | 9          |
| CellMutable  | #initialize        | 0          |
| CellMutable  | #evolve            | 3          |
| CellMutable  | #assign_neighbours | 0          |
| CellMutable  | #to_s              | 1          |
| CellMutable  | #count_neighbours  | 5          |
+--------------+--------------------+------------+
+--------------+-------------+------------+
|       lib/mutable/game_mutable.rb       |
+--------------+-------------+------------+
| Class/Module | Method      | Complexity |
+--------------+-------------+------------+
| GameMutable  | *           | 0          |
| GameMutable  | #initialize | 0          |
| GameMutable  | #start      | 0          |
+--------------+-------------+------------+
+--------------+-------------+------------+
|      lib/mutable/world_mutable.rb       |
+--------------+-------------+------------+
| Class/Module | Method      | Complexity |
+--------------+-------------+------------+
| WorldMutable | *           | 1          |
| WorldMutable | #initialize | 0          |
| WorldMutable | #fill_grid  | 1          |
| WorldMutable | #tick       | 0          |
| WorldMutable | #to_s       | 0          |
+--------------+-------------+------------+
+----------------+-------------+------------+
|     lib/immutable/world_immutable.rb      |
+----------------+-------------+------------+
| Class/Module   | Method      | Complexity |
+----------------+-------------+------------+
| WorldImmutable | *           | 0          |
| WorldImmutable | #initialize | 0          |
| WorldImmutable | #next_gen   | 0          |
| WorldImmutable | #to_s       | 0          |
+----------------+-------------+------------+
+--------------+-------------+------------+
|        lib/multi/world_multi.rb         |
+--------------+-------------+------------+
| Class/Module | Method      | Complexity |
+--------------+-------------+------------+
| WorldMulti   | *           | 0          |
| WorldMulti   | #initialize | 0          |
| WorldMulti   | #next_gen   | 0          |
| WorldMulti   | #to_s       | 0          |
+--------------+-------------+------------+
+--------------+--------------+------------+
|        lib/shared/game_shared.rb         |
+--------------+--------------+------------+
| Class/Module | Method       | Complexity |
+--------------+--------------+------------+
| GameShared   | *            | 0          |
| GameShared   | #initialize  | 0          |
| GameShared   | #start       | 0          |
| GameShared   | #print_world | 0          |
+--------------+--------------+------------+
+--------------+-------------------+------------+
|           lib/shared/cell_shared.rb           |
+--------------+-------------------+------------+
| Class/Module | Method            | Complexity |
+--------------+-------------------+------------+
| CellShared   | *                 | 10         |
| CellShared   | #initialize       | 0          |
| CellShared   | #still_alive      | 4          |
| CellShared   | #to_s             | 1          |
| CellShared   | #count_neighbours | 5          |
+--------------+-------------------+------------+
+--------------+-----------+------------+
|             lib/client.rb             |
+--------------+-----------+------------+
| Class/Module | Method    | Complexity |
+--------------+-----------+------------+
| Client       | *         | 0          |
| Client       | #new_game | 0          |
+--------------+-----------+------------+
```

## Setup

```
git clone https://github.com/moneysmartco/gameoflife
```
`cd` into the directory and run:
```
bin/main
```
Enter the choice of implementation to run as well as the grid size that you want to view the simulation in. The size should ideally be 50 or less, depending on your screen/terminal size. Cells are then randomly generated. Sit back and watch the cells evolve with each generation!
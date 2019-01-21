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
+--------------+--------------+------------+
|         ./lib/game_benchmark.rb          |
+--------------+--------------+------------+
| Class/Module | Method       | Complexity |
+--------------+--------------+------------+
| Game         | *            | 1          |
| Game         | #initialize  | 0          |
| Game         | #start       | 1          |
| Game         | #print_world | 0          |
+--------------+--------------+------------+
+--------------+-------------------+------------+
|                 ./lib/cell.rb                 |
+--------------+-------------------+------------+
| Class/Module | Method            | Complexity |
+--------------+-------------------+------------+
| Cell         | *                 | 10         |
| Cell         | #initialize       | 0          |
| Cell         | #still_alive      | 4          |
| Cell         | #to_s             | 1          |
| Cell         | #count_neighbours | 5          |
+--------------+-------------------+------------+
+--------------+-------------+------------+
|             ./lib/world.rb              |
+--------------+-------------+------------+
| Class/Module | Method      | Complexity |
+--------------+-------------+------------+
| World        | *           | 0          |
| World        | #initialize | 0          |
| World        | #next_gen   | 0          |
| World        | #to_s       | 0          |
+--------------+-------------+------------+
```
## Setup

```
git clone https://github.com/moneysmartco/gameoflife
```
`cd` into the directory and run:
```
ruby lib/main.rb
```
Enter the grid size that you want to view the simulation in. The size should ideally be 50 or less, depending on your screen/terminal size. Cells are then randomly generated. Sit back and watch the cells evolve with each generation!
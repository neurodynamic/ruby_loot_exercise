#Splitting the Loot
You, and your trusty band of adventurers, have stumbled upon a hidden cache of rubies! (What luck, eh?) Not all gems are created equal, so you sneak them home and take your time evaluating the stones. The find was an equal effort, and you're all horribly greedy, so you must find a fair system for dividing up the gems.

This week's Ruby Quiz is to write a program that fairly divides treasures, based on worth.

The first command-line argument to the program will be the number of adventures. All other arguments are the numerical values of treasures found.

Modified from Ruby Quiz #65 (so don't look at their solution!)

###Challenge levels:

1. Your program should output a fair split of the treasures, if possible, or a warning message if a fair split cannot be found. Example:

```
$ ruby loot.rb 3 1 2 3 4
It is not possible to fairly split this treasure 3 ways.
$ ruby loot.rb 2 9 12 14 17 23 32 34 40 42 49
1:  9 12 32 34 49
2:  14 17 23 40 42
```

2. If a fair split cannot be found, your program should output the fairest possible split, and the total value of each share. Example:

```
$ ruby loot.rb 3 1 2 3 4
1: 4    Total value: 4
2: 2 1  Total value: 3
3: 3    Total value: 3
```

https://github.com/magic-mornings/splitting-the-loot
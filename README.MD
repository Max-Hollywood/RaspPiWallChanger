# waller

Author:		Max-Hollywood

Filename:		waller.sh

Copyright (C) Max Hollywood 2019.

# Purpose

Changes the wallpaper over a set amount of time for the Raspberry Pi 3B+.

Run with the directory as an argument you want to load wallpapers from.

Uncomment the sub directories block to load any images in the sub directories of the initial directory you specified.

# Use

```bash
./waller ~/Pictures/Wallpapers			normal
./waller ~/Pictures/Wallpapers -v		verbose (tells you what it's doing)
./waller ~/Pictures/Wallpapers -s		singleton (quits after changing)
./waller ~/Pictures/Wallpapers -v -s
```

# Todo
- Specify to only consider files with a specific phrase in the name.
- TODO:	Count how many times each wallpaper has been used, and use less used wallpapers more frequently.



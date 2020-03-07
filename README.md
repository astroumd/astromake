# astromake

Building and managing packages and optionally multiple versions of them. Slightly geared towards astronomy.

This set of scripts allows you to manage loading packages in your unix shell, much like the module command. After
installation users need to add something like this to your appropriate dot-file:

	     source /n/astromake/astromake_start.sh
	     
after which they would be able to use commands such as

	     astroload casa

	     astroload -i casa

	     astroload -v 5.5.2 casa

to load a default casa, query which versions of casa are available, or load a specific version of the casa package.

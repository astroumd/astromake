# astromake

Building and managing packages and optionally multiple versions of them.  Geared towards astronomy.

This set of scripts allows you to manage loading packages in your unix shell, much like the **module** command. After
installation users need to add something like this to your appropriate dot-file:

	     source /n/astromake/astromake_start.sh
	     
after which they would be able to use commands such as

	     astroload casa

	     astroload -i casa

	     astroload -v 5.5.2 casa

to load a default casa, query which versions of casa are available, or load a specific version of the casa package.

## Other approaches

The *module* command works very similar to astroload.

RedHat's *alternatives* command manages alternative ways to make a command your default one, again
solving some of the things that we are solving here. It does not allow you to have different versions
in different shells.

Another approach is the SDKMAN: https://sdkman.io/

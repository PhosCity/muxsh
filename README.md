# Introduction

muxsh is a wrapper for [SubKt](https://github.com/Myaamori/SubKt) that was written with the aim of sorting out the output of SubKt. While the output of SubKt is not bad, the important information can sometimes be hidden among a wall of text that is not entirely necessary to the end user to see. So this tool takes both the stdout and stderr of SubKt and presents in more digestable format.

## Main feature of muxsh

* It's config based where you can save any number of your current projects. You can thus run this script and choose from one of your projects to mux it's episodes.
* Choose a single or multiple episodes to mux then all at once.
* Pass the path of the project directly as an argument to mux episodes in that folder if it's not saved in your config.
* Sort both the stdout and stderr of SubKt and present them less verbosely.
* Redo the last mux (single or mutiple episodes) with a flag.
* If you want to watch the original output of Subkt for the last mux you did, you can easily do so with a flag.
* Support for alternate folder structure. [Read more about alternate folder structure here.](https://github.com/PhosCity/muxsh#alternate-folder-structure)

# Installation
```
curl -s https://raw.githubusercontent.com/PhosCity/muxsh/main/muxsh -o "$HOME/.local/bin/muxsh"
chmod +x "$HOME/.local/bin/muxsh"
```

# Uninstallation
```
rm "$HOME/.local/bin/muxsh"
```

# Update
```
muxsh -u
```

# Usage

This project is primarily made for following folder structure:
```
.
├── 01
├── 02
├── 03
├── ...
└── Subkt Configs
```

You can simply run the script without any arguments or run with the flags as shown below. The first run of the script will prompt you to create a config. You can add projects to the config yourself using the flag `muxsh -c add` or `muxsh -c remove` to add and remove projects to the config respectively.

```
USAGE: muxsh [OPTIONS] arguments
[OPTIONS]
  -h	 		Show this help text and exit
  -o	 		See acutal subkt output of last mux in case you need it
  -p [path]		Path of the project (Does not have to be in config)
  -n [name]		Name of the project saved in config
  -e [digit]		Episode you want to mux
  -r	 		Repeat last muxing action
  -a	 		Alternate folder structure(./arc/episode)
  -c [add/remove]	Add or remove project in the config
  -v			Show the version and exit
```

Provided that you have saved your projects in config, `muxsh komi 4` will mux episode 4 of project named komi.

`muxsh -n komi -e 4` will have similar effect.

# Alternate Folder Structure
This program has a flag `-a` for alternate folder structure. You will probably never have to use this but I have implemented this folder structure for a couple of my projects thus I have added this here. The folder structure looks like this:
```.
├── 01 Name of Arc 1/ Season 1
│   ├── 01
│   ├── 02
│   └── ...
├── 02 Name of Arc2/ Season 2
│   ├── 01
│   ├── 02
│   └── ...
├── ...
│   ├── ...
└── Subkt Configs
```
This folder structure became necessary for me because I was handling projects of hundreds of epidodes and thus I had to divide the episodes in their respective arcs. If you have this folder structure, use `-a` flag while muxing and the project will prompt you to choose both an arc and the episode of that arc for muxing.

To explain briefly, instead of doing `mux.01`, we're doing `mux.arc_01` where, for automation, I set `arc` in sub.properties by taking the folder name of the arc, remove first 3 characters, make everything lowercase and remove space. So, for example, if the folder name was `02 Orange Town`, removing first 3 characters gives `Orange Town`, then making lowercase gives `orange town` and removing spaces gives `orangetown`. Thus, to mux episode 1 of arc `Orange Town`, the SubKt commands becomes `mux.orangetown_01`.

If the `arc` in the sub.properties has not been set to follow this rule, then the exception can be defined in config under `Exceptions` section as follows where key is what would it be if it followed the rule above and value is what is actually set in sub.properties:

```
[Exceptions]
davybackfight = dbf
```


# Acknowledgement

Thanks to [bucket3432](https://github.com/bucket3432) for all the help he provided while writing this script.

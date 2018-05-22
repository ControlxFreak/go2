# go2

A handy tool for quick navigation to commonly used, directories.  This tool utilizes the accompany tool to generate a nickname.conf file to store its nickname->directory mappings.  The main benefits of utilizing go2 over either alias directories or creating enviornment variables is tha is self contained in an easy to use, view and modify configuration file.

----

# Usage:

	go2 [-hp]

	go2 mynickname

	go2 -n nickname

	go2 -n nickname -d <path/to/directory>

   -h Display Help.

   -p Print the contents of the nickname file to the console.

   -n Create a nickname association for the given directory.

   -d Directory you wish to nickname [default=pwd]

Example:

   To nickname the directory '/home/aoth/bin/repo' as 'myrepo'

      go2 -n myrepo -d /home/aoth/bin/repo

   or

      nickname -d /home/aoth/bin/repo myrepo

   To change directories to '/home/aoth/bin/repo' using the 'myrepo' nickname

      go2 myrepo

   To see the contents of the nickname file

      go2 -p

   or

      nickname -p

----

# Installation

This installation guide will assume you put go2 in the $HOME/bin/go2 directory but you may place it anywhere you'd like.

Installation is simple.  Checkout the go2 repo wherever you want, export that path into your PATH enviornment variable so you don't need ./ and alias '. go2' so it executes in your current shell.

   1. $cd $HOME/bin
   2. $git clone https://github.com/ControlxFreak/go2.git	
   3. add the following to your ~/.bashrc

	export PATH=$PATH:$HOME/bin/go2

	alias go2='. go2'

# Currently Supporting

   bash


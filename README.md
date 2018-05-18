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
It is recommended that this repository is cloned to your ~/bin/ directory.  It is not required but will be assumed for this installation guide.

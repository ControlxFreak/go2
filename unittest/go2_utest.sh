# --------------------------------------------------------------------- #
#!/bin/bash
# go2_utest.sh
#	Quick and simple unit test to ensure that nickname and go2 are
#	working.
#
# Anthony Trezza
# 18 March 2018
# anthony.t.trezza@gmail.com
#
# License:
#      MIT License
#       
#       Copyright (c) 2018 Anthony Trezza
#
#       Permission is hereby granted, free of charge, to any person 
#       obtaining a copy of this software and associated documentation 
#       files (the "Software"), to deal in the Software without restriction,
#       including without limitation the rights to use, copy, modify, merge,
#       publish, distribute, sublicense, and/or sell copies of the Software, 
#       and to permit persons to whom the Software is furnished to do so, 
#       subject to the following conditions:
#       
#       The above copyright notice and this permission notice shall be 
#       included in all copies or substantial portions of the Software.
#
#       THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
#       EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
#       OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND 
#       NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
#       BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN 
#       ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
#       CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#       SOFTWARE.
# 
#
# Change Log:
#       - 18 May 2018 trezza Software Birthday! <(^.^)>
# TODO:
#	- 18 May 2018 trezza continue adding tests.
# --------------------------------------------------------------------- #

# ------------------------------------------------- #
# The following code for creating a temporary working directory was 
# provided by: https://stackoverflow.com/questions/4632028/how-to-create-a-temporary-directory

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d -p "$DIR"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# ------------------------------------------------- #

# 1.  Test go2 -h and the variable cleanup simultaneously
clear
echo "-------------------------------"
echo "Testing enviornment variables..."
if [ ! -z "$NICKNAME" ]; then
	echo "Fail: Enviornment Variable NICKNAME not cleared. Results: $NICKNAME"
	exit
fi

echo ""
echo "MANUAL TEST go2 -h..."
echo "Confirm you see the help screen."
echo ""
go2 -h
echo ""
read -p "Did the help screen appear (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Help Test: Pass.";;
  n|N ) echo "Help Test: Fail."; exit;;
  * ) echo "invalid";;
esac

if [ ! -z "$NICKNAME" ]; then
	echo "Fail: Enviornment Variable NICKNAME not cleared. Results: $NICKNAME"
	exit
fi
echo "Enviornment Variable Test: Pass."

# 2.  Test go2 -p 
clear
echo "-------------------------------"
echo "MANUAL TEST go2 -p..."
echo "Confirm you see the print screen."
echo ""
go2 -p
echo ""

read -p "Did the print screen appear (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Print Test: Pass.";;
  n|N ) echo "Print Test: Fail."; exit;;
  * ) echo "invalid";;
esac

# 3. Test nickname -h
clear
echo "-------------------------------"
echo "MANUAL TEST nickname -h..."
echo "Confirm you see the help screen."
echo ""
nickname -h
echo ""

read -p "Did the help screen appear (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Help Test: Pass.";;
  n|N ) echo "Help Test: Fail."; exit;;
  * ) echo "invalid";;
esac

# 4. Test nickname -p
clear
echo "-------------------------------"
echo "MANUAL TEST nickname -p..."
echo "Confirm you see the print screen."
echo ""
go2 -p
echo ""

read -p "Did the print screen appear (y/n)?" choice
case "$choice" in
  y|Y ) echo "Print Test: Pass.";;
  n|N ) echo "Print Test: Fail."; exit;;
  * ) echo "invalid";;
esac

# 5. Create a temporary nickname
clear
echo "-------------------------------"
echo "Testing Nickname Creation..."
echo "Creating Nickname Association to Temporary Directory..."
# Thank you: https://gist.github.com/earthgecko/3089509
NICKNAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo "Random Nickname: $NICKNAME"
nickname -d "$WORK_DIR" "$NICKNAME"
echo ""
nickname -p
echo ""
read -p "Did the print screen appear AND was $NICKNAME -> $WORK_DIR an element (y/n)?" choice
case "$choice" in
  y|Y ) echo "Print Test: Pass.";;
  n|N ) echo "Print Test: Fail."; exit;;
  * ) echo "invalid";;
esac



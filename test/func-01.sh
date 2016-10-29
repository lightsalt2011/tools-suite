#!/bin/bash

fSum 3 2
fSum()
{
	echo -e "$1,$2\n";
	return $(($1+$2));
}
fSum 5 7
total=$(fSum 3 2)
echo $?,$?



echo $(uname);
declare num=1000;

uname()
{
	echo "test!";
	((num++));
	return 100;
}
testvar()
{
	local num=10;
	((num++));
	echo $num;

}

uname;
echo $?
echo $num;
testvar;
echo $num;

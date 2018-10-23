#!/bin/bash
function quit {
	exit
}

function e {
	echo $1
}
e Hello
e World
e !
e
quit
echo foo

#!/bin/sh
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	platform="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	platfrom="osx"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	platfrom="freebsd"
fi

if [ "${USER}" != "root"]; then
	echo "$0 must be run as root!!!"
	exit 1
fi


MESSAGE=$"
USAGE: >>sh utility.sh -i [FILENAME]
\n============================================================ 
\n -h) Help function.
\n -001) check system information, such as Linux kernel version, distribution and so on. 			 
\n -002) print first 10 lines in file. 
\n -003) print last 10 lines in file. 
\n -004) replace '^A' with '/t'. 		
\n      to deal with control keys, see [ref] http://www.robelle.com/smugbook/ascii.html   
\n      to create control character in vim, use 'CTRL+V [character]'. ex. 'CTRL+V A'. 	
\n -005) count lines in file. 
\n -006) display line inforamtion of term in file.
\n -007) display column 2 in file. `cut`
\n -008) display column 2 in file. `awk`
\n      *NOTE: use of ascii code as delimiter is needed when you use cmds 'sed', 'awk/', etc. 
\n      Ex. >>cat -v [FILENAME] | sed 's/\^A/\^/g' | awk -F'^' '{print $2}' 			        
\n -009) merge files
\n -010) show all texts including escapsed characters in file
\n -011) check debian version
\n -012) kill all processes with regarding to keywords in one line
"

if [[ -z "$1" ]]
  then
    echo "No arguments supplied."
    echo $MESSAGE
    exit
fi

case $1 in
	-h  ) 
		echo $MESSAGE
		;;
	-001  )
		if [[ "$platfrom" == "linux" ]]; then
			echo "`cat /proc/version`"
		elif [[ "$platfrom" == "osx" ]]; then
			echo "`sw_vers -productVersion`"
		else
			echo $platfrom
		fi
		;;
	-002  )
		echo "`head -10 $2`"
		;;
	-003  )
		echo "`tail -10 $2`"
		;;
	-004  )
		outputname="out.raw"
		"`sed 's/\^A/\t/g' $2 > $outputname`" > /dev/null 2>&1
		echo "replace finished. output -> '$outputname'."
		### corrected. We can replace characters using sed directly and don't need to do 'cat -v'
		;;
	-005  )
		echo "`wc -l $2`"
		;;
	-006  )
		echo "`grep -in hello $2`"
		;;		
	-007  )
		echo "`cut -f2 -d $'\001' $2`"
		### or `cut -f2 -d ^B $2`
		### ^B should be typed as 'ctrl+v' + 'ctrl+b' rather than '^'+'b'. 		
		;;				
	-008  )
		echo "`awk -F^B '{print $2}' $2`"
		### ^B should be typed as 'ctrl+v' + 'ctrl+b' rather than '^'+'b'. 
		### first $2 represents the 2nd column in source, and the later means standard input.
		### [ref](http://www.unixcl.com/2009/10/grep-and-print-control-characters-in.html)
		;;				
	-009  )
		outputname="out.raw"
		"`cat ./sh_testutility/temp* > $outputname`" > /dev/null 2>&1
		echo "merge finished. output -> '$outputname'."
		;;	
	-010  )
		"`cat -e -v -t $2`"
		;;
	-011  )
		echo "`lsb_release -a`"
		;;
	-012  )
		echo '`ps aux | grep firefox | awk { system(  " kill -9 " $2 ) }`'
		;;		
esac
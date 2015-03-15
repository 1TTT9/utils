#!/bin/sh
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	platform="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
	platfrom="osx"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	platfrom="freebsd"
fi

MESSAGE=$"
USAGE: >>sh utility.sh -i [FILENAME]
\n============================================================ 
\n -h) Help function.
\n -1) check system information, such as Linux version, distribution and so on. 			 
\n -2) print first 10 lines in file. 
\n -3) print last 10 lines in file. 
\n -4) replace '^A' with '/t'. 		
\n      to deal with control keys, see [ref] http://www.robelle.com/smugbook/ascii.html   
\n      to create control character in vim, use 'CTRL+V [character]'. ex. 'CTRL+V A'. 	
\n -5) count lines in file. 
\n -6) display line inforamtion of term in file.
\n -7) display column 2 in file. 
\n      *NOTE: use of ascii code as delimiter is needed when you use cmds 'sed', 'awk/', etc. 
\n      Ex. >>cat -v [FILENAME] | sed 's/\^A/\^/g' | awk -F'^' '{print $2}' 			        

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
	-1  )
		if [[ "$platfrom" == "linux" ]]; then
			echo "`cat /proc/version`"
		elif [[ "$platfrom" == "osx" ]]; then
			echo "`sw_vers -productVersion`"
		else
			echo $platfrom
		fi
		;;
	-2  )
		echo "`head -10 $2`"
		;;
	-3  )
		echo "`tail -10 $2`"
		;;
	-4  )
		outputname="out.raw"
		"`cat -v $2 | sed 's/\^A/\t/g' > $outputname`" > /dev/null 2>&1
		echo "replace finished. output -> '$outputname'."
		;;
	-5  )
		echo "`wc -l $2`"
		;;
	-6  )
		echo "`grep -in hello $2`"
		;;		
	-7  )
		echo "`cut -f2 -d $'\001' $2`"
		;;				
	-8  )
		outputname="out.raw"
		"`cat ./sh_testutility/temp* > $outputname`" > /dev/null 2>&1
		echo "merge finished. output -> '$outputname'."
		;;	
						
esac
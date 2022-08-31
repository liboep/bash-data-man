#!/bin/bash

NUMARGS=$#
if [ $NUMARGS -eq 0 ]; then
  	echo 1056288 - 1054337
	exit 0;	
fi


if [ $1 = "-f" ] && [ -z "$2" ];	
then
	echo Invalid file.

elif [ $1 = "-f" ] && [ -z "$3" ];	#Elegxos options
then
	cat $2 | egrep -v "(^#.*)"		#Ektelesei entolhs cat me grep gia eyresh pattern

#Telos 1.1

elif  [ $1 = "-f" ] && [ $3 = "-id" ];	#Elegxos options 
then 
	string=$(cat $2 | grep -w $4)	#Apouhkeysh grammhs se string
    IFS='|' read -r -a array <<< "$string" #Apouhkeysh kaue stoixeioy kaue sthlhs se pinaka
    echo "${array[1]}" "${array[2]}" "${array[4]}" #Emfanish tvn zhtoymenvn stoixeivn
elif [ $3 = "-f" ] && [ $1 = "-id" ];	#Omoivs gia allagh seiras options
then
	string=$(cat $4 | grep -w $2)
    IFS='|' read -r -a array <<< "$string"
    echo "${array[1]}" "${array[2]}" "${array[4]}" 

#Telos 1.2

elif [ $1 = "--firstnames" ] && [ $2 = "-f" ];	#Elegxos options
then
    declare -A arr	#Dhlvsh pinaka
	i=-2
	while read p; do	#Read file line by line
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"	#Apouhkeysh kaue stoixeioy kaue sthlhs se pinaka
		if [ $i -ne -1 ];	#Paravlech prvths grammhs
		then		
			arr[$i]=${array[1]}	#Apouhkeysh tvn firstnames se pinaka
		fi
	done < $3

	for ((i = 0; i<9500; i++))
	do
		echo ${arr[$i]}	#Emfanish diakritvn firstnames se alafabhtikh seira
	done | sort -u
elif [ $3 = "--firstnames" ] && [ $1 = "-f" ]	#Omoivs gia allagh seiras options
then
    declare -A arr
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			arr[$i]=${array[1]}
		fi
	done < $2

	for ((i = 0; i<9500; i++))
	do 
		echo ${arr[$i]}
		
	done | sort -u


elif [ $1 = "--lastnames" ] && [ $2 = "-f" ]; 	#Omoivs gia lastnames
then
    declare -A arr
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			arr[$i]=${array[2]}
		fi
	done < $3

	for ((i = 0; i<9500; i++))
	do
		echo ${arr[$i]}
	done | sort -u
elif [ $3 = "--lastnames" ] && [ $1 = "-f" ];
then
	declare -A arr
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			arr[$i]=${array[2]}
		fi
	done < $2

	for ((i = 0; i<9500; i++))
	do
		echo ${arr[$i]}
	done | sort	-u
	
#Telos 1.3	

elif [ $1 = "--born-since" ] && [ $3 = "--born-until" ] && [ $5 = "-f" ];	#Elegxos options
then	
	bsince=$(date -d $2 +"%Y%m%d")	#Allagh morfhs hmeromhnias tvn arguments
	buntil=$(date -d $4 +"%Y%m%d")    
	i=-2
	while read p; do	#Omoivs me parapanv
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")	#Allagh morfhs hmeromhnias sto arxeio
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" ));	#Elegxos gia emfanish epiuymhtvn hmeromhnivn
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $6
elif [ $1 = "--born-until" ] && [ $3 = "--born-since" ] && [ $5 = "-f" ];	#Omoivs gia allagh seiras options
then	
	bsince=$(date -d $4 +"%Y%m%d") 
	buntil=$(date -d $2 +"%Y%m%d")    
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" )); 
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $6	
elif [ $1 = "-f" ] && [ $3 = "--born-since" ] && [ $5 = "--born-until" ];
then	
	bsince=$(date -d $4 +"%Y%m%d") 
	buntil=$(date -d $6 +"%Y%m%d")    
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" )); 
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $2	
elif [ $1 = "-f" ] && [ $3 = "--born-until" ] && [ $5 = "--born-since" ];
then	
	bsince=$(date -d $6 +"%Y%m%d") 
	buntil=$(date -d $4 +"%Y%m%d")    
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" )); 
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $2	
elif [ $1 = "--born-since" ] && [ $3 = "-f" ] && [ $5 = "--born-until" ];
then	
	bsince=$(date -d $2 +"%Y%m%d") 
	buntil=$(date -d $6 +"%Y%m%d")    
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" )); 
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $4	
elif [ $1 = "--born-until" ] && [ $3 = "-f" ] && [ $5 = "--born-since" ];
then	
	bsince=$(date -d $6 +"%Y%m%d") 
	buntil=$(date -d $2 +"%Y%m%d")    
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if (( "$dline" >= "$bsince" )) && (( "$dline" <= "$buntil" )); 
			then
 				echo ${array[*]};
			fi
		
		fi
	done < $4


elif [ $1 = "--born-since" ] && [ $3 = "-f" ];
then
		
	bsince=$(date -d $2 +"%Y%m%d") 		   
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if [ $dline -ge $bsince ]; 
			then
 				echo ${array[*]};
			fi
			
		fi
	done < $4
elif [ $1 = "-f" ] && [ $3 = "--born-since" ];
then
		
	bsince=$(date -d $4 +"%Y%m%d") 		   
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if [ $dline -ge $bsince ]; 
			then
 				echo ${array[*]};
			fi
			
		fi
	done < $2	
		
	
elif [ $1 = "--born-until" ] && [ $3 = "-f" ];
then		 
	buntil=$(date -d $2 +"%Y%m%d")    	
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if [ $dline -le $buntil ]; 
			then
 				echo ${array[*]};
			fi
				
		fi
	done < $4
elif [ $1 = "-f" ] && [ $3 = "--born-until" ];
then		 
	buntil=$(date -d $4 +"%Y%m%d")    	
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then		
			dline=$(date -d ${array[4]} +"%Y%m%d")
			if [ $dline -le $buntil ]; 
			then
 				echo ${array[*]};
			fi
				
		fi
	done < $2	
		
#Telos 1.4

elif [ $1 = "--socialmedia" ] && [ $2 = "-f" ];	#Elegxos options
then
	bl=`grep -wc Blogger $3`;	#Katametrhsh kaue social media
	fb=`grep -wc Facebook $3`;
	flr=`grep -wc Flickr $3`;
	goo=`grep -wc Google+ $3`;
	insta=`grep -wc Instagram $3`;
	lin=`grep -wc LinkedIn $3`;
	twi=`grep -wc Twitter $3`;
	ybe=`grep -wc Youtube $3`;

	echo Blogger $bl	#Emfanish
	echo Facebook $fb
	echo Flickr $flr
	echo Google+ $goo
	echo Instagram $insta
	echo LinkedIn $lin
	echo Twitter $twi
	echo Youtube $ybe
elif [ $1 = "-f" ] && [ $3 = "--socialmedia" ]; #Omoivs gia allagh seiras options
then
	bl=`grep -wc Blogger $2`; 
	fb=`grep -wc Facebook $2`;
	flr=`grep -wc Flickr $2`;
	goo=`grep -wc Google+ $2`;
	insta=`grep -wc Instagram $2`;
	lin=`grep -wc LinkedIn $2`;
	twi=`grep -wc Twitter $2`;
	ybe=`grep -wc Youtube $2`;

	echo Blogger $bl
	echo Facebook $fb
	echo Flickr $flr
	echo Google+ $goo
	echo Instagram $insta
	echo LinkedIn $lin
	echo Twitter $twi
	echo Youtube $ybe	


elif [ $1 = "-f" ] && [ $3 = "--edit" ];	#Elegxos options
then
	i=-2
	while read p; do	#Omoivs me parapanv
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then	
			if [ ${array[0]} -eq $4 ];	#Eyresh id sto arxeio
			then
				col=$[$5 - 1]	#Dioruvsh sthlhs
				ln=$[$i + 2]	#Dioruvsh seiras
				if [ $5 -ge 1 ] && [ $5 -le 8 ] #Elegxos an h sthlh poy dvuhke einai egkyrh
				then	
					sed -i -e ""$ln"s/${array[$col]}/$6/" $2	#Antikatastash
					break
				else
					echo Invalid column number
					break
				fi	
			fi
		fi		
	done < $2	
elif [ $1 = "--edit" ] && [ $5 = "-f" ];	#Omoivs gia allagh seiras options
then
	i=-2
	while read p; do
		i=$[i + 1]
		IFS='|' read -r -a array <<< "$p"
		if [ $i -ne -1 ];
		then	
			if [ ${array[0]} -eq $2 ];
			then
				col=$[$3 - 1]
				ln=$[$i + 2]
				if [ $3 -ge 1 ] && [ $3 -le 8 ]
				then	
					sed -i -e ""$ln"s/${array[$col]}/$4/" $6
					break
				else
					echo Invalid column number
					break
				fi	
			fi
		fi		
	done < $6	

#Telos 1.5

else 
	echo Invalid options or arguments!
fi



exit 0;
































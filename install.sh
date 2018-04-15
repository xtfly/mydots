#!/bin/bash

cd files

basepath=$(cd `dirname $0`; pwd)
#echo "current path: $basepath"

function ln_files()
{
    for item in `ls -a`
    do
        if [[ "." = "$item" || ".." = "$item" ]];then
            continue
        fi

        if [[ -d "$item" ]];then
            mkdir -p ~/$item 

            if [[ ".config" == "$item" ]];then 
                for sub_item in `ls -a $item` 
                do
                    if [[ "." = "$sub_item" || ".." = "$sub_item" ]];then
                        continue
                    fi  
                    rm -rf ~/$item/$sub_item
                    echo "ls -fs $basepath/$item/$sub_item ~/$item/$sub_item"
                    ln -fs $basepath/$item/$sub_item ~/$item/$sub_item              
                done
                continue
            fi
        fi

        echo "ls -fs $basepath/$item ~/$item"
        rm -rf ~/$item
        ln -fs $basepath/$item ~/$item
    done
}


ln_files

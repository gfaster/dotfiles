#!/bin/bash
cat packages_apt.txt | grep -v '^[ \t]*#' | grep -v "^$" |
    while IFS= read -r line; do
        echo "Text read from file: $line"
        echo $line
    done


# while getopts ":i:g:IG" opt; do
#     case $opt in
#         i)
#             echo "-i was used with $OPTARG"
#             ;;
#         g)
#             echo "-g was used with $OPTARG"
#             ;;
#         I)
#             echo "Install all"
#             ;;
#         G) 
#             echo "Get all"
#             ;;
#         \?)
#             echo "Unknown option $OPTARG"
#             exit 1
#             ;;
#     esac
# done
        

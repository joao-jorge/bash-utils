#! /bin/bash
#
# Simple bash script to compile programs
#

clear
FILE="$1"
NAME="${FILE%.*}" #Store name of the file (before the dot)
EXTENSION="${FILE##*.}" #Store the extension of the file (after the dot)

if [ $EXTENSION = "c" ]; then #Compile C programs
    gcc $FILE -lm -o $NAME && ./$NAME
elif [ $EXTENSION = "java" ]; then #Compile Java Programas
    javac $FILE && java $NAME
elif [ $EXTENSION = "cpp" ]; then #Compile C++ programs
    g++ $FILE -lm -o $NAME && ./$NAME
elif [ $EXTENSION = "jar" ]; then #Execute jar files
    java -jar $FILE
else
    echo "Não foi encontrado script para essa EXTENSION"
fi
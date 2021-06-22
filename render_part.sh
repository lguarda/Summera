for i in `perl -ne '/part\("(.*?)"\)/ && print("$1\n")' $1`; do openscad -DPART="\"$i\"" -o "./$(basename --suffix=".scad" $1)-$i.stl" $i; done

for file in $vimCD/config/kde/*; do
  file_name=${file##*/}
  echo $file_name
  file_home="/home/sonke/.config/$file_name"
  if test -e $file_home; then
    echo "file exists in home"
    mv --verbose $file_home /home/sonke/tmp/
  fi
  ln --symbolic --verbose $file $file_home
  echo "---"
done

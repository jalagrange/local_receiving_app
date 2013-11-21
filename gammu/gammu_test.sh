for file in "$@"
do
  echo $file
  perl change_device.pl 'gammu-smsdrc' "$file"
  gammu -c gammu-smsdrc identify
done

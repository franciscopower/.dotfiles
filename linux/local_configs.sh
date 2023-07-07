alias win="cd /mnt/c/Users/franc"
c () {
  rm $1
  make $1
  ./$1
}

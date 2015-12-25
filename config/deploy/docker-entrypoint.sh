#!/bin/sh
echo "\$*: $*"
echo "\$@: $@"
echo "\$0: $0"
echo "\$1: $1"
case $1 in
  "server" )
    cmd="rackup config.ru -p ${PORT}"
    ;;

  "console" )
    cmd="bin/console"
    ;;

  * )
    cmd="$@"
    ;;
esac

echo " ---> bundle exec ${cmd}"
exec bundle exec $cmd

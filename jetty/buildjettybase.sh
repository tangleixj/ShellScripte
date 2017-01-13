#!/bin/sh
##################################################################
# 1.get parameter
##################################################################
parameters=$#
if [ ${parameters} -lt 1 ];then
  read -p "INFO  : please input path of jetty.base " JETTY_BASE
else
  JETTY_BASE=$1
fi

##################################################################
# 2.init env
##################################################################
echo "INFO  : start build jetty.base ${JETTY_BASE}"
if [ ! -e ${JETTY_BASE} ];then
  mkdir -p ${JETTY_BASE}
  echo "INFO  :  create jetty.base"
else
  rm -rf ${JETTY_BASE}
  echo "INFO  :  clean up jetty.base"
fi

##################################################################
# 2.build
##################################################################
cd ${JETTY_BASE}
java -jar ${JETTY_HOME}/start.jar --add-to-startd=http,deploy
flag=$?

##################################################################
# 2.response result
##################################################################
if [ ${flag} -eq 0 ];then
  echo "INFO  :  build jetty.base success!"
else
  echo "INFO  :  build failed!"
fi



#!/bin/bash

cd ../
if [ $1 != "clean" ]; then
	make
fi
for((i=0;i<3;i++));
do
	local_path=local_build/$(expr $i + 8000)
	if [ $1 == "clean" ]; then
		echo ${local_path}
        #rm ${local_path}/nodes*
	else
	    cp src/redis-server $local_path
	    cd ${local_path} 
	    ./redis-server ./redis.conf
	    cd ..
	fi
done
cd -


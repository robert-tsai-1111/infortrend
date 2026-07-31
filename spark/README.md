

### Linux
Ubuntu
sudo apt-get install git make gcc

CentOS/RHEL
sudo yum install git make gcc

git clone https://github.com/gregrahn/tpch-kit.git
cd tpch-kit/dbgen
make MACHINE=LINUX DATABASE=POSTGRESQL


### macOS

xcode-select --install

git clone https://github.com/gregrahn/tpch-kit.git
cd tpch-kit/tpch3.0.1/dbgen
cp makefile.suite makefile
vim makefile
CC=gcc,CFLAGS ...

vim config.h
vim varsub.c
vim bm_utils
vim dss.h


make clean
make MACHINE=MACOS DATABASE=POSTGRESQL

(建立sf dataset)
./dbgen -s 1 	#1GB  sf-1
./dbgen -s 100 	#100G sf-100

ll *.tbl

./qgen -s 1000 | psql -h 172.27.125.15 -U infortrend -d tpch


(建立database)
createdb -U robert tpch
createdb -h 172.27.125.15 -U infortrend tpch
psql -U robert -d tpch -f dss.ddl
psql -h 172.27.125.15 -U infortrend -d tpch -f dss.ddl


\copy region FROM PROGRAM 'sed "s/|$//" region.tbl' WITH (DELIMITER '|');
\copy part FROM PROGRAM 'sed "s/|$//" part.tbl' WITH (DELIMITER '|');
\copy supplier FROM PROGRAM 'sed "s/|$//" supplier.tbl' WITH (DELIMITER '|');
\copy partsupp FROM PROGRAM 'sed "s/|$//" partsupp.tbl' WITH (DELIMITER '|');
\copy customer FROM PROGRAM 'sed "s/|$//" customer.tbl' WITH (DELIMITER '|');
\copy orders FROM PROGRAM 'sed "s/|$//" orders.tbl' WITH (DELIMITER '|');
\copy lineitem FROM PROGRAM 'sed "s/|$//" lineitem.tbl' WITH (DELIMITER '|');

\dt
\d


(產生query)
cp queries/*.sql ./

pwd
/Users/robert/infortrend/spark/tpch-kit/tpch3.0.1/dbgen

export DSS_QUERY=.
export DSS_CONFIG=$PWD
export DSS_PATH=$PWD

for i in {1..22}; do ./qgen -s 1000 "$i" > "query_${i}_sf1000.sql"; done


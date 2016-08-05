yum install -y redis mysql-server mysql-devel wget git vim
RUN /etc/init.d/mysqld star

export HOME=/home/work
export WORKSPACE=$HOME/open-falcon
mkdir -p $WORKSPACE
cd $WORKSPACE

git clone https://github.com/open-falcon/scripts.git
cd ./scripts/

mysql -h localhost -u root --password="" < db_schema/graph-db-schema.sql
mysql -h localhost -u root --password="" < db_schema/dashboard-db-schema.sql

mysql -h localhost -u root --password="" < db_schema/portal-db-schema.sql
mysql -h localhost -u root --password="" < db_schema/links-db-schema.sql
mysql -h localhost -u root --password="" < db_schema/uic-db-schema.sql

DOWNLOAD="http://7xrmam.com1.z0.glb.clouddn.com/open-falcon-v0.1.0.tar.gz"
cd $WORKSPACE

mkdir ./tmp
#下载
wget $DOWNLOAD -O open-falcon-latest.tar.gz

#解压
tar -zxf open-falcon-latest.tar.gz -C ./tmp/
for x in `find ./tmp/ -name "*.tar.gz"`;do \
    app=`echo $x|cut -d '-' -f2`; \
    mkdir -p $app; \
    tar -zxf $x -C $app; \
done


export HOME=/home/work
export WORKSPACE=$HOME/open-falcon
mkdir -p $WORKSPACE

# 安装Transfer
#transfer默认监听在:8433端口上，agent会通过jsonrpc的方式来push数据上来。
echo 'installing transfer'
cd $WORKSPACE/transfer/
mv cfg.example.json cfg.json
./control start

# 安装agent
echo 'installing agent'
cd $WORKSPACE/agent/
mv cfg.example.json cfg.json
./control start

# 安装graph
echo 'installing graph'
cd $WORKSPACE/graph/
mv cfg.example.json cfg.json
./control start
curl -s "http://127.0.0.1:6071/health"

# 安装Query
ehco 'installing query'
cd $WORKSPACE/query/
mv cfg.example.json cfg.json
./control start

# 安装Dashboard
echo 'installing dashboard'
cd $WORKSPACE/dashboard/
virtualenv ./env

./env/bin/pip install -r pip_requirements.txt
./control start
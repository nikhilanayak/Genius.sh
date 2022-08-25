install_node (){
  echo NodeJS not installed. Installing NodeJS..

  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
}


command -v node > /dev/null || install_node

THREADS=1024
BATCH_SIZE=4096

start=$1
end=$2

parallel -j$THREADS --progress ./scrape.sh ::: $(seq $start $end)


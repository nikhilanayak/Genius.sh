install_node (){
  echo NodeJS not installed. Installing NodeJS..

  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt update
  sudo apt install -y nodejs
}


install_parallel (){
  echo GNU Parallel not installed. Installing GNU Parallel..

  sudo apt update
  sudo apt install -y parallel
}

command -v node > /dev/null || install_node
command -v parallel > /dev/null || install_parallel


THREADS=1024
BATCH_SIZE=4096

start=$1
end=$2

parallel -j$THREADS --progress ./scrape.sh ::: $(seq $start $end)


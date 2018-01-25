#!/bin/bash
echo "Checking java version"
java -version 2>/dev/null || (echo "Installing java 8..." && sudo apt-get update && sudo apt-get install -y openjdk-8-jdk)
echo Java version is $(echo $(java -version 2>&1 >/dev/null | grep 'version' | awk '{print $3}') | cut -c2-4)
echo "Checking Docker version"
docker -v 2>/dev/null || (echo "Installing Docker..." && curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh && docker -v)
echo "Checking if Datadog is installed"
/etc/init.d/datadog-agent info 2>/dev/null || (echo "Installing Datadog" && DD_API_KEY=877c66dee5181aff4932b479f44324f6 bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)")
echo "Upgrading sbt if possible"
sbt_repo="deb https://dl.bintray.com/sbt/debian /"
sbt_repo_file=/etc/apt/sources.list.d/sbt.list
if [ ! -f  $sbt_repo_file ] || ! grep -q $sbt_repo $sbt_repo_file; then
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
fi
sudo apt-get update
sudo apt-get install sbt
echo "Checking ZSH version"
# written for user ubuntu
zsh --version 2>/dev/null || (sudo apt-get install -y zsh && sudo chsh -s /bin/zsh ubuntu && sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && cp /home/ubuntu/.oh-my-zsh/templates/zshrc.zsh-template /home/ubuntu/.zshrc && perl -pi.back -e 's/robbyrussell/blinks/g' /home/ubuntu/.zshrc && source /home/ubuntu/.zshrc)
echo "Installing basic python packages if not already installed"
sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
echo "Provisioning done"

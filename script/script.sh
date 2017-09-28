#!/bin/bash
/bin/bash
echo "Checking java version"
java -version 2>/dev/null || (echo "Installing java 8..." && sudo apt-get update && sudo apt-get install -y openjdk-8-jdk)
echo Java version is $(echo $(java -version 2>&1 >/dev/null | grep 'version' | awk '{print $3}') | cut -c2-4)
echo "Checking Docker version"
docker -v 2>/dev/null || (echo "Installing Docker..." && curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh && docker -v)
echo "Checking ZSH version"
# written for user ubuntu
zsh --version 2>/dev/null || (sudo apt-get install -y zsh && sudo chsh -s /bin/zsh ubuntu && su ubuntu sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && cp /home/ubuntu/.oh-my-zsh/templates/zshrc.zsh-template /home/ubuntu/.zshrc && perl -pi.back -e 's/robbyrussell/blinks/g' /home/ubuntu/.zshrc && source /home/ubuntu/.zshrc)
echo "Provisioning Done!"
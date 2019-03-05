AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |\
  sudo tee /etc/apt/sources.list.d/azure-cli.list
wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y microsoft-mlserver-all-9.3.0 --allow-unauthenticated
/opt/microsoft/mlserver/9.3.0/bin/R/activate.sh
apt list --installed | grep microsoft

# add to rstudio
echo "rsession-which-r=/opt/microsoft/mlserver/9.3.0/bin/R/R" >> /etc/rstudio/rserver.conf
echo "r-libs-user=/opt/microsoft/mlserver/9.3.0/libraries/RServer/" >> /etc/rstudio/rsession.conf

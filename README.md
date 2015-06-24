#Request to PDF



#move to temp folder
cd tmp
#download
wget -q http://downloads.sourceforge.net/project/wkhtmltopdf/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
#install package
sudo dpkg --install wkhtmltox-0.12.2.1_linux-trusty-amd64.deb
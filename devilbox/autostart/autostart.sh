#! /bin/bash

#composer
/usr/local/bin/composer self-update 1.10.19

#n98
wget https://files.magerun.net/n98-magerun2.phar \
	&& chmod +x ./n98-magerun2.phar \
	&& mv ./n98-magerun2.phar /usr/local/bin/
	
#magento-cache-clean
composer global require --dev mage2tv/magento-cache-clean

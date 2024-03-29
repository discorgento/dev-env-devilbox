#! /bin/bash

#composer
composer self-update --2.2

#magento-cache-clean
composer-2 global require --dev mage2tv/magento-cache-clean \
	&& mv /root/.composer /home/devilbox/.composer \
	&& sudo chown -R devilbox /home/devilbox/.composer

#n98
curl -L -o n98-magerun2.phar https://files.magerun.net/n98-magerun2.phar \
	&& chmod +x ./n98-magerun2.phar \
	&& mv ./n98-magerun2.phar /usr/local/bin/


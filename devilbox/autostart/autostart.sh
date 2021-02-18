#! /bin/bash

#composer ccw global
composer-1 global require --dev mage2tv/magento-cache-clean \
	&& mv /root/.composer /home/devilbox/.composer \
	&& sudo chown -R devilbox /home/devilbox/.composer

#n98 global
wget https://files.magerun.net/n98-magerun2.phar \
	&& chmod +x ./n98-magerun2.phar \
	&& mv ./n98-magerun2.phar /usr/local/bin/

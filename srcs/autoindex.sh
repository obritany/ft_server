# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoindex.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obritany <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/22 13:52:49 by obritany          #+#    #+#              #
#    Updated: 2021/03/22 13:52:51 by obritany         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if grep -q "autoindex on" /etc/nginx/sites-available/nginx_available
then
    sed -i "s/autoindex on;/autoindex off;/" /etc/nginx/sites-available/nginx_available
    echo "Autoindex off"
else
    sed -i "s/autoindex off;/autoindex on;/" /etc/nginx/sites-available/nginx_available
    echo "Autoindex on"
fi
nginx -s reload

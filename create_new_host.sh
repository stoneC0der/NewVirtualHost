# !/bin/bash
# Created by StoneC0der
#You can use ${confirm^^} == 'YES'
# -s for password (Just a reminder).

# Warning 
echo Notice: This script is provided with no Warranty"\n"I will not be held responsible "for" any damage or lost, use it at your risk.

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Get DocumentRoot Path
echo Enter DocumentRoot path "(Absolute path to your web project)".

read -p DOCUMENT_ROOT: 

# Confirm DocumentRoot Path
read -p "Check if the path is correct before continuing ? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Get ServerAlias.
echo Enter ServerAlias "(www.example.com)".

read -p SERVER_ALIAS:

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Get ServerName.
echo Enter ServerName "(example.com)".

read -p SERVER_NAME:

read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Last Warning
read -p "To avoid manually editing the files \n Please verify that everything above is correct before.? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Store all variables as a string.
VIRTUAL_HOST="\n
<VirtualHost *:80>\n
  ServerName $SERVER_NAME\n
  ServerAlias ${SERVER_ALIAS}\n
  DocumentRoot $DOCUMENT_ROOT\n
  ErrorLog \"/private/var/log/apache2/bar-error_log\"\n
  CustomLog \"/private/var/log/apache2/bar-access_log\" common\n
</VirtualHost>"

# Add virtual Host to httpd-vhosts.conf
echo $VIRTUAL_HOST >> /etc/apache2/extra/httpd-vhosts.conf

# Add virtualhost to HOSTS file so it can be resolve locally.
NEW_HOST="\n127.0.0.1   ${SERVER_NAME}  ${SERVER_ALIAS}"

echo $NEW_HOST >> /etc/hosts

# Restart Apache
apachectl graceful



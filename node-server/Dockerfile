FROM node:8

# Create app directory
# WORKDIR /usr/src/app
WORKDIR /var/www

# www-data = 33

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY src/package*.json /var/www/
COPY wait-for-it.sh /wait-for-it.sh

RUN npm install && chmod +x /wait-for-it.sh
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY src/* /var/www/
COPY src/modules/* /var/www/modules/

EXPOSE 5000
CMD [ "/wait-for-it.sh", "postgres:5432", "-t", "180", "--", "npm", "start" ]
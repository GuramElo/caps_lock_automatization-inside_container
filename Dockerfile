FROM node:18

# Install Python and build tools
RUN apt-get update && apt-get install -y python3 build-essential

# Install X11 development libraries and other dependencies
RUN apt-get install -y libx11-dev libxtst-dev xdotool

# Create a non-root user to run the app (recommended for security)
RUN useradd -ms /bin/bash nodeuser
USER nodeuser


WORKDIR /home/nodeuser/app
# 574038778 

# Copy package.json and package-lock.json (if you have it)
COPY --chown=nodeuser:nodeuser package*.json ./

# Install project dependencies
RUN npm install

# This package will help us check the Caps Lock state
# RUN npm install x11 xkb

# Copy the rest of your application code
COPY --chown=nodeuser:nodeuser . .

# Choose your strategy (uncomment one):

# 1. Direct Key Press (Linux, might need additional permissions)
# CMD ["xdotool", "key", "Caps_Lock"]

# 2. REST API (Recommended for better control and security)
# EXPOSE 3000
CMD ["npm", "start"]


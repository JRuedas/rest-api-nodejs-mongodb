# Set the base image
FROM node:10.19.0-stretch-slim

# Set the workdir
WORKDIR /app

# Copy the dependency files
COPY package.json package-lock.json ./

# Install required dependencies and cleans npm cache
RUN npm i && npm cache clean --force

# Copy the app's folders and source code
COPY . .

# Default environment variables
ENV NODE_ENV production
ENV MONGODB_URL mongodb://127.0.0.1:27017/app_db
ENV JWT_SECRET=12345
ENV JWT_TIMEOUT_DURATION="2 hours"
ENV EMAIL_SMTP_HOST YourSMTPHost
ENV EMAIL_SMTP_PORT YourSMTPPort
ENV EMAIL_SMTP_USERNAM YourSMTPUsername
ENV EMAIL_SMTP_PASSWORD YourSMTPPassword
# true for 465, false for other ports
ENV EMAIL_SMTP_SECURE false 

# Exposed ports
EXPOSE 3000

# Container entrypoint
ENTRYPOINT ["npm", "run", "dev"]
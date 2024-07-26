# Use an appropriate base image with Bash
FROM ubuntu:20.04

# Set environment variables to non-interactive to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    cowsay \
    fortune-mod \
    socat \
    && rm -rf /var/lib/apt/lists/*

# Copy the Bash script into the Docker image
COPY wisecow.sh /usr/local/bin/wsecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wsecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Run the script
CMD ["/usr/local/bin/wsecow.sh"]


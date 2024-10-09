# Use the official Python image
FROM python:3.10-slim

# Set up a working directory
WORKDIR /app

# Install Git and MkDocs with necessary plugins
RUN apt-get update && \
    apt-get install -y git && \
    pip install mkdocs mkdocs-material \
    mkdocs-minify-plugin \
    mkdocs-git-revision-date-localized-plugin \
    mkdocs-awesome-pages-plugin

# Clean up unnecessary files after installation
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the project files to the container
COPY . /app

# Expose the default MkDocs port
EXPOSE 8000

# Run the MkDocs server
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
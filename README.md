This is the respository backing the official [modding documentation](https://docs.voxeltycoon.xyz) for [Voxel Tycoon](https://voxeltycoon.xyz) — a tycoon strategy game about transportation, factories, and mining infinite voxel landscapes.

## How to test your contribution locally

You can use Docker to quickly set up a local development environment for this project. This is especially helpful to ensure consistency across different environments and avoid installing dependencies directly on your machine.

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed on your system

### Usage

1. **Build the Docker image:**

   ```bash
   docker build -t mkdocs-dev .
   ```

2. **Run the Docker container:**

   ```bash
   docker run -p 8000:8000 -v "$(pwd)":/app mkdocs-dev
   ```

   This command mounts your current directory to `/app` inside the container, so any changes you make locally will be reflected in the running MkDocs instance.

3. **Access the site:**

   Open your browser and go to [http://localhost:8000](http://localhost:8000). The site will automatically refresh as you make changes to the source files.

### Notes

- The `Dockerfile` sets up MkDocs along with the required plugins. If additional dependencies are added to the project, update the `Dockerfile` as necessary.
- For troubleshooting or debugging, check Docker’s logs or refer to the MkDocs [documentation](https://www.mkdocs.org/).

## Manual install without Docker

### Install
1. [Install Material for MkDocs](https://squidfunk.github.io/mkdocs-material/getting-started/#installation).
2. Instal plugins:
  * `pip install mkdocs-minify-plugin`
  * `pip install mkdocs-git-revision-date-localized-plugin`
  * `pip install mkdocs-awesome-pages-plugin`
 
### Run
1. Run `mkdocs serve`.
2. Go to [http://localhost:8000](http://localhost:8000).
3. Pages will automatically refresh as you apply changes to sources.

## Talk to community
<a href="//discord.gg/voxeltycoon"><img src="https://discordapp.com/api/guilds/346672255084003329/embed.png?style=banner2"/></a>

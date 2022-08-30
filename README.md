# Paper-Minecraft-Docker-ARMv7
A simple Linux Docker Image for Paper Minecraft Sever.
This Docker Image is supported by 32bit OS 

## Command
First of all you have to build the Dockerfile

```docker build . -t mcserver```

After that you need to run the container in this way

```docker run --name papermc -p 0.0.0.0:25565:25565 -d -it papermc```

### Environment Variables
Environment variables are options that are specified in the format `-e <NAME>="<VALUE>"` where `<NAME>` is the name of the environment variable and `<VALUE>` is the value that the environment variable is being set to. Please note that setting an evironment variable with no value does not leave it at default; instead, this sets it to an empty string, which may cause issues. This image has four environment variables:
- Minecraft Eula
  - **Name:** `MINECRAFT_EULA`
  - Set this parameter to True to accept the Terms and run the server
- Version
  - **Name:** `MINECRAFT_VERSION`
  - Set this to the Minecraft version that the server should support.
- RAM
  - **Name:** `MEMORYSIZE`
  - Set this to the amount of RAM the server can use.
  - Must be formatted as a number followed by `M` for "Megabytes" or `G` for "Gigabytes"
- Java Flags
  - **Name:** `JAVAFLAGS`
  - **ADVANCED USERS ONLY**
  - Set to any additional Java flags that you would like to include.


**PLEASE NOTE:** This is an unofficial project. I did not create PaperMC. [This is the official PaperMC website.](https://papermc.io/)

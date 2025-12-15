# .NET Application Developer Container
# Use the official Red Hat Universal Base Image 10 as the foundation.
FROM registry.access.redhat.com/ubi10/ubi:latest

# Good practice to label your images.
LABEL maintainer="Your Name <youremail@example.com>" \
      description=".NET 10 SDK development environment based on UBI 10."

# Install .NET SDK and some other useful packages
#     dotnet-sdk-10.0 - includes the dotnet runtime and development kit
#     ncurses - makes it easy to clear the screen 
#     procps  - provides process management and resource utilization info
#
# We clean up the dnf cache to keep the image size down
RUN dnf install -y \
        dotnet-sdk-10.0 \
        ncurses \
        procps \
    && dnf clean all


# Set the working directory to the new user's home.
WORKDIR /app

# Expose port 8000. This makes the port available for mapping to the host,
# which is necessary for testing web applications when running in container
# mode.
EXPOSE 8000

# Set the default command. When the container starts, it will drop you into a Bash shell.
CMD ["/usr/bin/bash"]

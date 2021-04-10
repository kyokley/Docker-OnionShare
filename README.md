# Docker OnionShare
## Introduction
OnionShare (https://onionshare.org/) is a tool for securely and anonymously sharing files and communicating. The purpose of this repo is to dockerize running the server to put all of the required software into a convenient container.
## Usage
```
docker run --rm -t kyokley/onionshare
```
That's it. Running this command displays OnionShare's help and is useful in seeing all available options.

### Chat
```
docker run --rm -t kyokley/onionshare --chat
```

### Sending/Receiving Files
The Dockerfile defines `/files` as the working directory inside the container. Therefore, the easiest way to send and receive files is to mount a directory from the host machine into the container at that `/files` location.

#### Sending a File
To send a file or share a directory in the current folder, try the following:
```
docker run --rm -t -v $(pwd):/files kyokley/onionshare filename
```
or,
```
docker run --rm -t -v $(pwd):/files kyokley/onionshare directory
```

#### Receiving Files
Similarly, to receive files to the current directory, use the following:
```
docker run --rm -t -v $(pwd):/files kyokley/onionshare --receive
```

### Further Examples
Since typing the full docker command can be tedious, it may be helpful to define a convenience function in your bashrc like:
```
onionshare () {
    docker run --rm -t -v $(pwd):/files kyokley/onionshare $@
}
```
After reloading the terminal, commands can be executed more simply. To receive files to the current directory:
```
onionshare --receive
```
Or, serving a file from the current directory:
```
onionshare filename
```

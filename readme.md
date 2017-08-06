# KiCad

[KiCad](http://kicad-pcb.org) is an open source software suite for Electronic Design Automation (EDA). The programs handle Schematic Capture, and PCB Layout with Gerber output. The suite runs on Windows, Linux and OS X and is licensed under GNU GPL v3.

## Usage

```bash
docker run --rm \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--volume ~/workspace:/home/workspace \
ware/kicad 
```

Above, we made the container's processes interactive, forwarded our DISPLAY environment variable, mounted a volume for the X11 unix socket, and recorded the container's ID. This will fail at first and look something like this, but that's ok:

```bash
No protocol specified
Error: Unable to initialize GTK+, is DISPLAY set properly?
```

We can then adjust the permissions the X server host.

```bash
xhost +local:docker
```

**Optional:**

```bash
docker run --rm \
--volume /tmp/.X11-unix:/tmp/.X11-unix \
--env DISPLAY=unix:$DISPLAY \
--env LANG=$LANG \
--env RUNUSER_UID=$(id -u) \
--volume ~/workspace:~/workspace:/home/workspace \
ware/kicad
```

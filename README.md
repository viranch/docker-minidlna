# docker-minidlna

Docker image with MiniDLNA installed that shares `/media` container directory over DLNA.

### Using the image

1. Install docker

2. Run the following command:

```
docker run -d --name minidlna --net host -v </your/media/location>:/media viranch/minidlna
```

3. Stream your media on a UPnP/DLNA compliant device.

#### Note for MacOS

If you're using docker on MacOS (this usually means having a VirtualBox VM with a docker installation, which is done by the docker MacOS installer), you need to do some extra steps to get this working. DLNA server & clients need to be on same network but the VirtualBox VM has a NATed network adapter. You need to add a new bridged network adapter:

1. Stop the VM: `docker-machine stop default`

2. Open VirtualBox, select the VM with name "default" and go to its Settings -> Network -> Select an unused Adapter, enable it and select "Bridged Adapter" under "Attached to:" field.

3. Start the VM: `docker-machine start default`

4. From VirtualBox, again select the "default" VM and click on Show. This will open up the terminal of the VM, use `ifconfig` to figure out the new bridged network adapter, say it is `eth2`.

5. Now add `-e NIC=eth2` in the above run command after the `-v` switch.

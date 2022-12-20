# Don't Break Your Debian

Ensure that your /etc/apt/sources.list[.d/*] files have the same `release` alias (like buster* or stable* or testing*). 

 
# Install missing firmware

* https://unix.stackexchange.com/a/445689/65781

      sudo apt-get install firmware-linux-nonfree 

* Install any further firmware from kernel.org/.../linux-firmware.git:

  http://forums.debian.net/viewtopic.php?f=30&t=145496#p718725

# Install newer kernel 

> See https://unix.stackexchange.com/a/545609/65781

* Enable backports
* `sudo apt update` 
* `sudo apt install -t bullseye-backports linux-image-amd64 btrfs-progs linux-headers-amd64`
* `sudo apt install -t bullseye-backports firmware-linux --reinstall`
* `sudo dkms autoinstall`
* Check VirtualBox (try to start an existing VM)
> Not sure: * `sudo apt install --reinstall -o Dpkg::Options::="--force-confask,confnew,confmiss" grub-common os-prober`


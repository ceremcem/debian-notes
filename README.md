# Install missing firmware

* https://unix.stackexchange.com/a/445689/65781

      sudo apt-get install firmware-linux-nonfree 

* Install any further firmware from kernel.org/.../linux-firmware.git:

  http://forums.debian.net/viewtopic.php?f=30&t=145496#p718725

# Install newer kernel from backports 

> See https://unix.stackexchange.com/a/545609/65781

* Enable backports
* `sudo apt update` 
* `sudo apt install -t bullseye-backports linux-image-amd64 btrfs-progs linux-headers-amd64`
* `sudo apt install -t bullseye-backports firmware-linux --reinstall`
* `sudo dkms autoinstall`
* Check VirtualBox (try to start an existing VM)
> Not sure: * `sudo apt install --reinstall -o Dpkg::Options::="--force-confask,confnew,confmiss" grub-common os-prober`


# Upgrading

* sudo apt update 
* sudo apt upgrade # upgrade existing packages first 
* Don't Break Your Debian
  * Replace CURR_CODENAME with NEXT_CODENAME in /etc/apt/sources.list
  * Replace CURR_CODENAME with NEXT_CODENAME in /etc/apt/sources.list.d/*
* sudo apt update
* sudo service vboxdrv stop && sudo systemctl stop vboxautostart-service
* sudo kill `/bin/ps aux|grep VBoxSV[C] | awk '{print $2}'`
* sudo apt upgrade --without-new-pkgs
* sudo apt full-upgrade
* If there is a problem with aufs-dkms:
  * sudo apt purge aufs-dkms
  * sudo apt full-upgrade
* sudo apt autoremove

* FOR KERNEL UPGRADE: 
  * DISABLE BACKPORTS: sudo rm /etc/apt/sources.list.d/backports.list
  * apt-cache search linux-image
  * sudo apt install linux-image-<flavour> linux-headers-<flavour>


# Check for Frankendebian 

(Source: ChatGPT)

* apt list --installed | grep '/unstable\|/testing'
* dpkg --get-selections | grep hold
* dpkg -l | grep -i ubuntu



#Things to do for custom installer ISO
Taken from [serverfault](https://serverfault.com/questions/517908/how-to-create-a-custom-iso-image-in-centos#521672)

###Extra info on making kickstart for us
[Red Hat docs](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-kickstart2-options)

###Create a directory to mount your source.

`mkdir /tmp/bootiso`

###Loop mount the source ISO you are modifying. (Download from Red Hat / CentOS.)

`mount -o loop /path/to/some.iso /tmp/bootiso`

###Create a working directory for your customized media.

`mkdir /tmp/bootisoks`

###Copy the source media to the working directory.

`cp -r /tmp/bootiso/* /tmp/bootisoks/`

###Unmount the source ISO and remove the directory.

`umount /tmp/bootiso && rmdir /tmp/bootiso`

###Change permissions on the working directory.

`chmod -R u+w /tmp/bootisoks`

###Copy your Kickstart script which has been modified for the packages and `%post` to the working directory.

`cp /path/to/someks.cfg /tmp/bootisoks/isolinux/ks.cfg`

###Copy any additional RPMs to the directory structure and update the metadata.

`cp /path/to/*.rpm /tmp/bootisoks/Packages/.`
then
`cd /tmp/bootisoks/Packages && createrepo -dpo .. .`

###Add kickstart to boot options.

`sed -i 's/append\ initrd\=initrd.img/append initrd=initrd.img\ ks\=cdrom:\/ks.cfg/' /tmp/bootisoks/isolinux/isolinux.cfg`

###Create the new ISO file.

```
cd /tmp/bootisoks && \ 
mkisofs -o /tmp/boot.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -V "CentOS 7 x86_64" -R -J -v -T isolinux/. .
```

###Add an MD5 checksum (to allow testing of media).

`implantisomd5 /tmp/boot.iso`

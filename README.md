# makemkv-beta-deb
Method to create debian packages for `makemkv`, using `checkinstall`.
Adapted from https://github.com/chukfinley/makemkv-deb
with some updates.

- allows to provide the version number on the command line
- does not install, but only creates the `.deb` packages
- keeps the original tarballs around
- does not attempt to build the GUI
- still need to fetch the beta key for `makemkv` manually

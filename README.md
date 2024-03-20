# v2.0 - NWSync uploader for Digital Ocean Spaces
This is an application that I use in my CI for my personal nwn projects.

This will ingest your nwsync files and upload them to a DigitalOcean Space.

# Requirements
1. [s3cmd](https://github.com/s3tools/s3cmd)
2. [Digital Ocean Spaces](https://www.digitalocean.com/products/spaces/) account created
3. Access keys created for the above Digital Ocean Spaces account

# Creating Digital Ocean Spaces 
You can find this on the [Digital Ocean Official Documentation](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key#creating-an-access-key)

# Configure s3cmd

You can find this on the [Setting Up s3cmd 2.x with DigitalOcean Spaces](https://docs.digitalocean.com/products/spaces/reference/s3cmd/)

# Configure nwsync

You will need to update the [nwsync-update.sh](https://github.com/StefanoND/nwn-nwsync-digitalOcean-uploader/blob/main/nwsync-update.sh) file with your module's path.

Key         | Value
------------|--------------------------------
modulepath  | The path to your module (i.e: '$HOME/.local/share/Neverwinter Nights/modules/mymodule.mod')

# Configure uploadNWSync

You will need to update the [uploadNWSync.sh](https://github.com/StefanoND/nwn-nwsync-digitalOcean-uploader/blob/main/uploadNWSync.sh) file with your Digital Ocean Space information.

Key         | Value
------------|--------------------------------
spacename   | Your space name (i.e: nwsync)
modulename  | This is used to support handling multiple modules in one Space. The name can be anything with no spaces (i.e: demo-module)

# How do I use it?

You first need to run nwsync-update.sh

Then run uploadNWSync.sh

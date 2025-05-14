#!/bin/bash
set -e

echo "[INFO] Starting setup for Huawei Cloud"

echo "---------------------------------------------- Installing required packages ----------------------------------------------"
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y logrotate jq postfix curl unzip xfsprogs

# Create mount point
sudo mkdir -p /data

# Detect the unmounted disk (assumes vdb is the extra disk)
DISK="/dev/vdb"
MOUNT_POINT="/data"

# Check if disk already has a filesystem
if sudo blkid $DISK; then
  echo "[INFO] $DISK already has a filesystem. Skipping mkfs."
else
  echo "[INFO] Creating XFS filesystem on $DISK"
  sudo mkfs.xfs $DISK
fi

# Backup fstab
sudo cp /etc/fstab /etc/fstab.bak

# Get UUID of the disk
UUID=$(sudo blkid -s UUID -o value $DISK)
if [ -z "$UUID" ]; then
  echo "[ERROR] Failed to get UUID of $DISK"
  exit 1
fi
echo "[INFO] UUID of $DISK is $UUID"

# Add to /etc/fstab if not already present
if ! grep -q "$UUID" /etc/fstab; then
  echo "[INFO] Adding mount entry to /etc/fstab"
  echo "UUID=$UUID  $MOUNT_POINT  xfs  defaults,nofail  0  2" | sudo tee -a /etc/fstab
fi

# Mount the disk
sudo mount -a

# Set ownership
sudo chown -R $USER:$USER $MOUNT_POINT

echo "[INFO] Disk mounted successfully at $MOUNT_POINT"

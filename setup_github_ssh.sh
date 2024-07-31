#!/bin/bash

# Prompt for GitHub email
read -p "Enter your GitHub email: " email

# Generate a new SSH key
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""
if [ $? -ne 0 ]; then
    echo "Failed to generate SSH key. Exiting."
    exit 1
fi

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"
if [ $? -ne 0 ]; then
    echo "Failed to start ssh-agent. Exiting."
    exit 1
fi

# Add the SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519
if [ $? -ne 0 ]; then
    echo "Failed to add SSH key to ssh-agent. Exiting."
    exit 1
fi

# Display the public key
echo "Your SSH public key is:"
cat ~/.ssh/id_ed25519.pub

# Ask if they want to copy the SSH key to clipboard
read -p "Do you want to copy the SSH key to the clipboard? (y/n) " copy_key

if [ "$copy_key" == "y" ]; then
    # Check if xclip is installed
    if ! command -v xclip &> /dev/null; then
        echo "xclip is not installed. Installing xclip..."
        sudo apt-get update
        sudo apt-get install -y xclip
        if [ $? -ne 0 ]; then
            echo "Failed to install xclip. Exiting."
            exit 1
        fi
    fi
    # Copy the SSH public key to the clipboard
    xclip -selection clipboard < ~/.ssh/id_ed25519.pub
    if [ $? -eq 0 ]; then
        echo "SSH public key copied to clipboard."
    else
        echo "Failed to copy SSH public key to clipboard."
    fi
else
    echo "You chose not to copy the SSH key to clipboard."
    # Display the public key
  echo "Your SSH public key is:"
  cat ~/.ssh/id_ed25519.pub

  echo ""
  echo "Copy the above key and add it to your GitHub account at:"
  echo "https://github.com/settings/keys"
  echo ""
  echo "To test your SSH connection, run: ssh -T git@github.com"
fi

exit 0
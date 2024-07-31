# GitHub SSH Setup Script

This script automates the process of setting up SSH keys for GitHub on a Linux Mint machine. It generates a new SSH key, adds it to the ssh-agent, and displays the public key for easy copying to GitHub.

## Prerequisites

Ensure you have the following installed on your Linux Mint machine:

- OpenSSH (usually pre-installed)
- `xclip` (for copying the SSH key to clipboard, optional)

You can install `xclip` with:
```bash
sudo apt-get install xclip
```

## Usage

1. **Download the Script**

   Save the script as `setup_github_ssh.sh`.

   ```bash
   wget https://github.com.com/asibhossen897/setup_github_ssh/setup_github_ssh.sh
   ```

2. **Make the Script Executable**

   Change the script permissions to make it executable.

   ```bash
   chmod +x setup_github_ssh.sh
   ```

3. **Run the Script**

   Execute the script.

   ```bash
   ./setup_github_ssh.sh
   ```

4. **Follow the Prompts**

   - The script will prompt you for your GitHub email.
   - It will generate a new SSH key and add it to the ssh-agent.
   - The script will display your SSH public key.

5. **Add the SSH Key to GitHub**

   - Copy the displayed SSH public key.
   - Go to [GitHub](https://github.com) and log in.
   - In the upper-right corner of any page, click your profile photo, then click **Settings**.
   - In the user settings sidebar, click **SSH and GPG keys**.
   - Click **New SSH key** or **Add SSH key**.
   - In the "Title" field, add a descriptive label for the new key.
   - Paste your key into the "Key" field.
   - Click **Add SSH key**.

6. **Test Your SSH Connection**

   Run the following command to test your connection to GitHub:

   ```bash
   ssh -T git@github.com
   ```

   If your setup was successful, you should see a message like:

   ```plaintext
   Hi username! You've successfully authenticated, but GitHub does not provide shell access.
   ```

## Troubleshooting

### Git Still Asking for Username and Password

If Git is still asking for a username and password, you may need to ensure you're using the SSH URL for your repositories.

1. **Check the Remote URL**

   Verify that your Git repository is using the SSH URL. Run the following command in your repository directory:

   ```bash
   git remote -v
   ```

   The output should look like this:

   ```plaintext
   origin  git@github.com:username/repository.git (fetch)
   origin  git@github.com:username/repository.git (push)
   ```

   If you see `https://` URLs instead of `git@github.com:`, you need to change the remote URL to SSH.

2. **Change the Remote URL to SSH**

   Run the following command to set the remote URL to use SSH:

   ```bash
   git remote set-url origin git@github.com:username/repository.git
   ```

   Replace `username` with your GitHub username and `repository` with your repository name.

3. **Test the Setup Again**

   After changing the remote URL, try pushing or pulling again to ensure Git is using SSH:

   ```bash
   git push
   ```

   You should no longer be prompted for a username and password.

## License

This script is open-source and available under the MIT [License](LICENSE.txt). Feel free to use and modify it as needed.

## Author

This script was created by [Asib Hossen](https://github.com/asibhossen897).

---

Feel free to reach out if you encounter any issues or have any questions.

autopush.sh

#What this command does:

autopush.sh automates all of the commands needed to stage, commit, and push changes to a Git
repo. With some user input, I'm able to include a commit message, with a default message of thetime in case there is no input for the message, the choice to pick the files I want committed,and confirmation before it's even committed. It'll help save time by reducing the amount of Git commands i'd have to do manually.

#Why/When this command is useful:

It saves me time from having to type all the Git commands. It prevents me from pushing anythingI didn't want to. I can chose which files to commit instead of adding everything.

#How to use this command:

(chmod +x autopush.sh to make it executable)
(mv autopush.sh /usr/local/bin/autopush to use my command from anywhere)

1. Make sure you're in a Git repo
2. Make all of your directories, files, .txts, etc.
3. Once finalized, run: autopush "Commit Message"
4. If you want to select your files, enter "y" or "Y", and choose so. If not, enter "n". 
5. Confirm if you want to push the changes.
6. "y" or "Y" will commit, and "n" will abort the process, but commit the changes locally.

#Example
autopush "examplea2"
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   examplea2/something.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        a2/
        sample1/

Do you want to select specific files to commit? (y/n)
y
Enter file names (separated by spaces) or press Enter to cancel:
examplea2/something.txt
[main 1fe0680] examplea2
 1 file changed, 2 insertions(+)
 create mode 100644 examplea2/something.txt
Commit completed with message: "examplea2"
Would you like to push the changes? (y/n)
y
Username for 'https://github.com': jahshoeuh
Password for 'https://jahshoeuh@github.com': 
Username for 'https://github.com': jahshoeuh
Password for 'https://jahshoeuh@github.com': 
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 2 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 326 bytes | 326.00 KiB/s, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/jahshoeuh/cs131.git
   82e3413..1fe0680  main -> main
Changes pushed successfully!

That's it!

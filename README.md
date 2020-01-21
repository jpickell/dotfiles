#<a name="top">My Dotfiles</a>
---

My "dotfile" collection.   Lots of prompt and environment customization for Bash and Vim along with a couple of legacy dotfiles that I keep around for historical reasons.

- [.bashrc](#.bashrc)
- [.bash_profile](#.bash_profile)
- [.zshrc](#.zshrc)
- [jkp.zsh-theme](#jkp.zsh-theme)
- [.colors](#.colors)
- [.emacs](#.emacs)
- [.git](#.git)
- [.gvimrc](#.gvimrc)
- [.screenrc](#.screenrc)
- [.vim](#.vim)

---

**<a name=".bashrc">.bashrc</a>**

Bash prompt is colorized based on environment.  Servers in my current environment conform to a somewhat simple naming convention in that all names must start with the environment that they operate in.  This allows me to color code portions of my prompt based on my environment.  

Brackets and separators as follows:
- PROD/PRD - Red
- TEST/TST - Yellow
- DEV      - Green
- SAND     - Cyan
- Other    - White

<img src="images/bash_prompts.png" alt="Example of environment specific colorized prompt">

*(FYI -- I added the dashes in the picture to obscure actual server names and although not shown here, if you sudo to a root shell, the user name changes to 'root' and is colorized red.)*

**bin/git-branch.pl**
- Perl snippet to show the git branch of the current directory (if it is under git control) and a nifty bit that gets rid of the error messages when git is not installed on a server.

OS Specific sections for some aliases and environment variables:
- Linux
- SunOS
- Darwin

**Aliases**
- Some nifty keyboard aliases to make common CLI strings a bit simpler to access, broken up by logical function

**Functions**
- Text Notes
   1. **n**  -- By itself will create a note with today's date as the name of the note.  With an argument it will create a note with that name if it does not already exist.  If the note already exists, it will open the existing note in $EDITOR
   2. **nls**  -- Lists all existing notes.  (Notes are created and stored in ~/Notes)

- Working with the Workspace
   1. **W** -- By itself will list all directories under ~/Workspace.   With an argument it will change to that working directory and clear the screen



Command logging to the PROMPT_COMMAND per https://spin.atomicobject.com/2016/05/28/log-bash-history/ is now enabled by default.



[-top-](#top)

---

**<a name=".bash_profile">.bash_profile</a>**
- simple redirect to my .bashrc

[-top-](#top)

---

**<a name=".zshrc">.zshrc</a>**
- Includes improved note functions

[-top-](#top)

---

**<a name="jkp.zsh-theme">jkp.zsh-theme</a>**
- Zsh theme that sets the prompt to include user, date, pwd and git status.  Prompt turns red when sudo'ed to root.

[-top-](#top)

---

**<a name=".gvimrc">.gvimrc</a>**
- Added a couple of nice features: 
   1. With a little help from [lmutracker](https://gist.github.com/Glavin001/76ffcca87b946aa0b550f3ca46cb) the background color (dark or light) now initializes based on the Macbook ambient light sensor.
   2. Mapped &lt;Leader&gt; b to enable on the fly switching from dark to light backgrounds.
   3. Mapped &lt;Leader&gt; z to toggle "Zen Mode" - a super simple distraction free full screen mode. 

- Added a left margin using "foldcolumn=2" (colorized to match the bg via zen.vim)

- Added a much improved status line

Uses the zen.vim colorscheme located in ~/.vim/colors

[-top-](#top)

---

**<a name=".vim">.vim</a>**
- Various vim plugins 

[-top-](#top)

---

**<a name=".emacs">.emacs</a>**
- an ancient dotfile that needs to be updated.  Mostly here for historical purposes.

---

[-top-](#top)

**<a name=".screenrc">.screenrc</a>**  
- Simple mode line and a few key bindings
- soon to be replaced w/tmux.  someday.  maybe.

[-top-](#top)

---

For more dotfiles head over to <a href="https://dotfiles.github.io">https://dotfiles.github.io</a>

---


Last Updated: Tue Dec 31 21:02:25 CST 2019

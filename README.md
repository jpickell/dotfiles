#<a name="top">My Dotfiles</a>
---

My "dotfile" collection.   Lots of prompt and environment customization for Bash and Vim along with a couple of legacy dotfiles that I keep around for historical reasons.

- [.bashrc](#.bashrc)
- [.bash_profile](#.bash_profile)
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

<img src="http://www.jeffpickell.com/images/bash_prompts.png" alt="Example of environment specific colorized prompt">

*(FYI -- I added the dashes in the picture to obscure actual server names and although not shown here, if you sudo to a root shell, the user name changes to 'root' and is colorized red.)*

**bin/git-branch.pl**
- Perl snippet to show the git branch of the current directory (if it is under git control) and a nifty bit that gets rid of the error messages when git is not installed on a server.

OS Specific sections for some aliases and environment variables:
- Linux
- SunOS
- Darwin

[-top-](#top)

---

**<a name=".bash_profile">.bash_profile</a>**
- simple redirect to my .bashrc

[-top-](#top)

---

**<a name=".gvimrc">.gvimrc</a>**
- Added a couple of nice features: 
   1. Mapped &lt;Leader&gt; b to enable on the fly switching from dark to light backgrounds.
   2. Mapped &lt;Leader&gt; z to toggle "Zen Mode" - a super simple distraction free full screen mode. 

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


Last Updated: Tue Apr 19 16:05:05 CDT 2016

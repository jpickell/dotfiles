#My Dotfiles

My "dotfile" collection.   Lots of prompt and environment customization for Bash and Vim along with a couple of legacy dotfiles that I keep around for historical reasons.

- [.bash_profile](#.bashrc)
- .bashrc
- .colors
- .emacs
- .git
- .gvimrc
- .screenrc
- .vim

**<a name=".bashrc">.bashrc</a>**
---
Bash prompt is colorized based on environment.   At my current place of employment, servers conform to a somewhat simple naming convention in that all names must start with the environment that they operate in.  This allows me to color code portions of my prompt based on my environment.  

Brackets and separators as follows:
- PROD/PRD - Red
- TEST/TST - Yellow
- DEV      - Green
- SAND     - Cyan
- Other    - White

<img src="http://www.jeffpickell.com/images/bash_prompts.png" alt="Example of environment specific colorized prompt">

*(FYI -- I added the dashes in the picture to obscure actual server names and although not shown here, if you sudo to a root shell, the user name changes to 'root' and is colorized red.)*

**bin/git-branch.pl**
Perl snippet to show the git branch of the current directory (if it is under git control) and a nifty bit that gets rid of the error messages when git is not installed on a server.

OS Specific sections for some aliases and environment variables:
-Linux
-SunOS
-Darwin

**.bash_profile**
---
- simple redirect to my .bashrc

**.gvimrc**
---
- Added a couple of nice features: 
   1. Mapped &lt;Leader&gt; b to enable on the fly switching from dark to light backgrounds.
   2. Mapped &lt;Leader&gt; z to toggle "Zen Mode" - a super simple distraction free full screen mode. 

Uses the zen.vim colorscheme located in ~/.vim/colors


**.emacs**
---
- an ancient dotfile that needs to be updated.  Mostly here for historical purposes.

**.screenrc**  
---
- Simple mode line and a few key bindings
- soon to be replaced w/tmux.  someday.  maybe.

========
For more dotfiles head over to <a href="https://dotfiles.github.io">https://dotfiles.github.io</a>



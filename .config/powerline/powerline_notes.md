Powerline Notes
===============

## Admin/Tips/Tricks ##

**Restarting**
* restart powerline by restarting the application (best way)
* `powerline-daemon --replace`
  - check with `ps aux | grep "[p]owerline"`

**Starting**
* Have this in your .bash\_profile
  `$ powerline-daemon -q`

**Linting**
`$ powerline-lint`


## Important files ##

**Main config location**:
  * <powerline>/config.json
    + Contains settings for extensions themes and colorschemes
    + This is where you set logging, if something is misbehaving!
      `"common": {
           "log_file": "~/<somewhere.log>",
           "log_level": "debug"
       }`

**Main theme location**:
  * themes/powerline.json
    + Contains unicode symbols for fancy powerline (default).

## Colorscheme Notes ##

* Some of the default schemes don't come with all fields - you have to create/design your own.
  Looking at you, `.../tmux/solarized.json`.

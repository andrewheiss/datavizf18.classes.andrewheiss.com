# dataviz.andrewheiss.com

This repository contains the code for generating [dataviz.andrewheiss.com](https://dataviz.andrewheiss.com).

## Theme

This site uses my custom [`ath-tufte-hugo` theme](https://github.com/andrewheiss/ath-tufte-hugo) as a submodule.

When cloning for the first time, use this command to get the theme too:

    git clone --recursive https://github.com/andrewheiss/ath-tufte-hugo.git

To get the theme later, use this command:

    git submodule add \
      https://github.com/andrewheiss/ath-tufte-hugo.git \
      themes/ath-tufte-hugo

To update to the latest version of the theme, use:

    git submodule update --recursive --remote

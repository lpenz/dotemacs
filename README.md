[![CI](https://github.com/lpenz/dotemacs/actions/workflows/ci.yml/badge.svg)](https://github.com/lpenz/dotemacs/actions/workflows/ci.yml)

# dotemacs

My ~/.emacs.d directory, using github actions to do a minimal CI job.


## Install instructions

Manually:

    $ git clone git@github.com:lpenz/dotemacs.git ~/.emacs.d


... or using ansible-pull:

    $ ansible-pull -U https://github.com/lpenz/dotemacs.git -i localhost, ansible-playbook.yml


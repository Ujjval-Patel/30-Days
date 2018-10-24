#!/bin/bash

curl -L https://cpanmin.us | perl - --sudo App::cpanminus 

# basic usage
cpanm --help         # get help
cpanm URI            # install the URI module from CPAN
cpanm DateTime@1.44  # install version 1.44

#insalling to a local lib
cpanm --local-lib <path> <module>[@version]
cpanm --local-lib local URI   # install to ./local
cpanm -l local URI            # same but less typing
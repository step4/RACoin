Racoin 
================================

- Copyright (c) 2009-2014 Bitcoin Developers
- Copyright (c) 2011-2014 Litecoin Developers
- Copyright (c) 2017 Christian Rausch, Moritz Schneider, HS Koblenz

What is Racoin?
----------------

Racoin is a version of Bitcoin using scrypt as a proof-of-work algorithm.
 - 5 minute block targets
 - subsidy halves 210000 blocks(~1 year)
 - 525600 total coins

The rest is the same as Bitcoin.
 - 50 coins per block
 - 288 blocks to retarget difficulty


License
-------

Racoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.


How to:
-------
Linux - Ubuntu 16.04:
1. Install dependencies:
```
    sudo add-apt-repository ppa:bitcoin/bitcoin -y
    sudo apt-get update -y
    sudo apt-get install libboost-all-dev -y
    sudo apt-get install libssl-dev -y
    sudo apt-get install libdb4.8-dev libdb4.8++-dev -y
    sudo apt-get install libminiupnpc-dev -y
```
2. Create 'racoin.conf' in "~/.racoin" and paste:
```
    addnode=step4.de
    rpcuser=theUsernameOfYourChoice
    rpcpassword=thePasswordOfYourChoice
```
3. Start racoin-qt


MacOS:
1. Install dependencies:
```
brew install berkeley-db@4 openssl boost@1.57 qt5
```
2. Create 'racoin.conf' in "/Users/chris/Library/Application Support/RACoin" and paste:
```
    addnode=step4.de
    rpcuser=theUsernameOfYourChoice
    rpcpassword=thePasswordOfYourChoice
```
3. Start RACoin-Qt.app

Windows:
1. Create 'racoin.conf' in "C:Users\youruser\AppData\Roaming\Racoin" and paste:
```
    addnode=step4.de
    rpcuser=theUsernameOfYourChoice
    rpcpassword=thePasswordOfYourChoice
```
2. Start racoin-qt.exe
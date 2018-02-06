#Dependencies:

sudo apt-get install git -y

sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils -y

sudo apt-get install libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y

sudo apt-get install libboost-all-dev -y

sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:bitcoin/bitcoin -y

sudo apt-get update -y

sudo apt-get install libdb4.8-dev libdb4.8++-dev -y

sudo apt-get install libminiupnpc-dev -y

sudo apt-get install libzmq3-dev -y

sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler -y

sudo apt-get install libqt4-dev libprotobuf-dev protobuf-compiler -y

git clone -b 0.8 https://github.com/litecoin-project/litecoin.git

mv litecoin racoin

cd racoin

sed -i -e '242s/<const CScriptID&>/<CScriptID>/' ./src/rpcrawtransaction.cpp

find . -type f -print0 | xargs -0 sed -i 's/litecoin/racoin/g'
find . -type f -print0 | xargs -0 sed -i 's/Litecoin/Racoin/g'
find . -type f -print0 | xargs -0 sed -i 's/LiteCoin/Racoin/g'
find . -type f -print0 | xargs -0 sed -i 's/LITECOIN/RACOIN/g'
find . -type f -print0 | xargs -0 sed -i 's/LTC/RAC/g'

find . -type f -print0 | xargs -0 sed -i 's/9333/8393/g'
find . -type f -print0 | xargs -0 sed -i 's/9333/8393/g'
find . -type f -print0 | xargs -0 sed -i 's/193331/1393/g'
find . -type f -print0 | xargs -0 sed -i 's/19333/18393/g'

# Change first letter of addresses: https://en.bitcoin.it/wiki/List_of_address_prefixes
sed -i -e '275s/48/60/' ./src/base58.h
sed -i -e '275s/L/R/' ./src/base58.h
sed -i -e '275s/L/R/' ./src/base58.h
sed -i -e '277s/111/122/' ./src/base58.h


# these commands were done and the public keys are in the sed commands
# openssl ecparam -genkey -name secp256k1 -out alertkey.pem
# openssl ec -in alertkey.pem -text > alertkey.hex
# openssl ecparam -genkey -name secp256k1 -out testnetalert.pem
# openssl ec -in testnetalert.pem -text > testnetalert.hex
# openssl ecparam -genkey -name secp256k1 -out genesiscoinbase.pem
# openssl ec -in genesiscoinbase.pem -text > genesiscoinbase.hex


sed -i -e '22s/040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9/04c43e47dbe02a0d8714eb93de70a4b265a441542794ea9b92ee3eedd6e17bfaba37a9bac470cc78295fb9d35dac1f5e747072a279498e7b4f56cb6348f2d8dc5e/' ./src/alert.cpp
sed -i -e '22s/04302390343f91cc401d56d68b123028bf52e5fca1939df127f63c6467cdf9c8e2c14b61104cf817d0b780da337893ecc4aaff1309e536162dabbdb45200ca2b0a/0434c2f2e0b36705d13c01ed26d4f91e7447443daaceb14f4b3833943eacdee611e4e876f0fdcb368a20ea88efb96ab9c38efcbb1067974d82138b4676c0d19359/' ./src/alert.cpp
sed -i -e '2788s/040184710fa689ad5023690c80f3a49c8f13f8d45b8c857fbcbc8bc4a8e4d3eb4b10f4d4604fa08dce601aaf0f470216fe1b51850b4acf21b179c45070ac7b03a9/04b181100e4263236bcb114966a69a6ad2663b5c92c536178136bc073426439e31040d9f072c811b26a9bd519c1509cd711dd3e4a613cd289d297ea3c88922b5ab/' ./src/main.cpp

## magic peer bits
sed -i -e '2745s/0xfc/0xf3/' ./src/main.cpp
sed -i -e '2746s/0xc1/0xc6/' ./src/main.cpp
sed -i -e '2747s/0xb7/0xb8/' ./src/main.cpp
sed -i -e '2748s/0xdc/0xd1/' ./src/main.cpp

sed -i -e '3082s/0xfb, 0xc0, 0xb6, 0xdb/0xfc, 0xc1, 0xb1, 0xd3/' ./src/main.cpp


## change network hardcoded parameter

sed -i -e '1236s/0x38a9b992, 0x73d4f3a2, 0x43eda52e, 0xa1c4a2b2, 0x73c41955, 0x6992f3a2, 0x729cb992, 0x8b53b205,/0x0100007f/' ./src/net.cpp
sed -i -e '1237,1310d' ./src/net.cpp
sed -i -e '1185,1187d' ./src/net.cpp
sed -i -e '1176,1180d' ./src/net.cpp


# change coinbase reward
sed -i -e '1090s/50/50/' ./src/main.cpp

# change reward halving around 2 years
sed -i -e '1093s/840000/210000/' ./src/main.cpp

# change difficulty change after 1 day
sed -i -e '1098s/3.5/1/' ./src/main.cpp

# change block finding approx each 5 min
sed -i -e '1099s/2.5/5/' ./src/main.cpp

# change maximum number of coins 42000000 ~ mined in 400 years
sed -i -e '55s/84000000/42000000/' ./src/main.h

# change maturity to 30 = val + 20
sed -i -e '58s/100/10/' ./src/main.h

# trx priority should be approx ammount of coins per day ~ 288
sed -i -e '627s/576/288/' ./src/main.h

# i think change genesis block data part
sed -i -e '2782d' ./src/main.cpp
sed -i -e '2781a const char* pszTimestamp = "The start of RACoin, the start of something wonderful";' ./src/main.cpp

# change coinbase for genesisblock
sed -i -e '2787s/50/50/' ./src/main.cpp

# change genesis block timestamp
timenow=$(date +%s) # testnet
sed -i -e '2800s/1317798646/'"${timenow}"'/' ./src/main.cpp

timenow=$(date +%s) # mainnet
sed -i -e '2794s/1317972665/'"${timenow}"'/' ./src/main.cpp


# compile once, run once so daemon will generate valid merkle root and dumps it assertion in ~/.racoin/debug.log
cd src
make -f makefile.unix
./racoind

sleep 1
cd ..

mr=$(tail -1 ~/.racoin/debug.log)
echo $mr
stringarray=($mr)
mr=${stringarray[2]}
echo $mr

sed -i -e '2809s/0x97ddfbbae6be97fd6cdf3e7ca13232a3afff2353e29badfab7f73011edd4ced9/0x'"${mr}"'/' ./src/main.cpp

# insert genesis block mining code
cp ../gbCode.cpp src/
# paste gbCode in main.cpp

rm ./src/mainTemp.cpp
touch ./src/mainTemp.cpp
head -2802 ./src/main.cpp >> ./src/mainTemp.cpp
head -46 ./src/gbCode.cpp >> ./src/mainTemp.cpp
tail -2000 ./src/main.cpp >> ./src/mainTemp.cpp

mv ./src/main.cpp ./src/mainBAK.cpp
mv ./src/mainTemp.cpp ./src/main.cpp

sed -i -e '38s/0x12a765e31ffd4059bada1e25190f6e98c99d9714d334efa41a195a7e7e04bfe2/0x/' ./src/main.cpp

## compile once, run once so daemon will generate valid genesis block and dumps it assertion in ~/.racoin/debug.log
#redo manually for testnet
cd src
make -f makefile.unix
./racoind

cd ..

# paste hash
mr=$(tail -9 ~/.racoin/debug.log | head -1)
echo $mr
stringarray=($mr)
mr=${stringarray[4]}
echo $mr

sed -i -e '38s/0x/0x'"${mr}"'/' ./src/main.cpp

# paste nonce
mr2=$(tail -10 ~/.racoin/debug.log | head -1)
echo $mr2
stringarray=($mr2)
mr2=${stringarray[4]}
echo $mr2

sed -i -e '2796s/2084524493/'"${mr2}"'/' ./src/main.cpp

# disable genesis block code
sed -i -e '2805s/true/false/' ./src/main.cpp


# remove checkpoints(against bruteforce attacks)
#redo manually for testnet
sed -i -e '39,54d' ./src/checkpoints.cpp
sed -i -e '38s/1500/0/' ./src/checkpoints.cpp
sed -i -e '38s/841a2965955dd288cfa707a755d05a54e45f8bd476835ec9af4402a2b59a2967/'"${mr}"'/' ./src/checkpoints.cpp
sed -i -e '42s/1410516073/'"${timenow}"'/' ./src/checkpoints.cpp
sed -i -e '43s/4896865/0/' ./src/checkpoints.cpp
sed -i -e '45s/7000.0/1.0/' ./src/checkpoints.cpp


# change/add copyrights
sed -i -e '22d' ./src/qt/aboutdialog.cpp
sed -i -e '21a ui->copyrightLabel->setText(tr("Copyright") + QString(" &copy; 2009-%1 ").arg(COPYRIGHT_YEAR) + tr("The Bitcoin developers") + QString("<br>") + tr("Copyright") + QString(" &copy; ") + tr("2011-%1 The Litecoin developers").arg(ABOUTDIALOG_COPYRIGHT_YEAR)+ QString("<br>") + tr("Copyright") +QString(" &copy; ") + tr("%1 Christian Rausch, Moritz Schneider, HS Koblenz").arg(2017));' ./src/qt/aboutdialog.cpp
sed -i -e '29s/Racoin/Litecoin/' ./src/qt/splashscreen.cpp
sed -i -e '46s/line3/line4/' ./src/qt/splashscreen.cpp
sed -i -e '51a pixPaint.drawText(paddingLeftCol2,paddingTopCol2+line3,copyrightText3);' ./src/qt/splashscreen.cpp
sed -i -e '29a QString copyrightText3   = QChar(0xA9)+QString(" %1 ").arg(2017) + QString(tr("Christian Rausch, Moritz Schneider, HS Koblenz"));' ./src/qt/splashscreen.cpp
sed -i -e '21a int line4 = 39;' ./src/qt/splashscreen.cpp

sed -i -e '46s/#define COPYRIGHT_STR          "2009-" STRINGIZE(COPYRIGHT_YEAR) " The Bitcoin developers 2011-" STRINGIZE(COPYRIGHT_YEAR) " The Litecoin developers"/#define COPYRIGHT_STR          "2009-" STRINGIZE(COPYRIGHT_YEAR) " The Bitcoin developers 2011-" STRINGIZE(COPYRIGHT_YEAR) " The Litecoin developers 2017 Christian Rausch, Moritz Schneider, HS Koblenz"/' ./src/qt/res/bitcoin-qt.rc

sed -i -e '95s/Racoin/Litecoin/' ./src/qt/forms/aboutdialog.ui
sed -i -e '95s/<\/string>//' ./src/qt/forms/aboutdialog.ui
sed -i -e '95a Copyright &amp;copy; 2017 Christian Rausch, Moritz Schneider, HS Koblenz</string>' ./src/qt/forms/aboutdialog.ui

cp -R ../pixmaps/ share/
cp -R ../icons/ src/qt/res/
cp -R ../images/ src/qt/res/

# compile gui
qmake
make
#./racoin-qt

# perl script: if you need to add an own seed node
 
# #!/usr/bin/perl
 
# # Twobits twobit integer dotted quad to reverse hex convertor
# #  designed for q&d use to put seeds into pnSeeds in *coins
 
# my $ip;
 
# if (@ARGV) {
#     $ip = shift @ARGV;
# } else {
#     print "Enter an (dotted quad) ip address: ";
#     chomp( $ip = <STDIN> );
# }
 
# printf "0x%08x\n",  unpack 'N', pack 'C4', reverse split '\.', $ip;
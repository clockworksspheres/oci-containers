# README_ubuntu-20.04-build-latest_developing-packer-json-notes.md

Notes collected from: https://github.com/giuspen/cherrytree and annotated

Building Cherrytree on Ubuntu 20.04

Install dependencies::

sudo apt install build-essential libxml2-utils cmake libgtkmm-3.0-dev libgtksourceviewmm-3.0-dev libxml++2.6-dev libsqlite3-dev libcpputest-dev gettext python3-lxml libgspell-1-dev libcurl4-openssl-dev

Get cherrytree source, compile and run:

git clone https://github.com/giuspen/cherrytree.git
mkdir cherrytree/build
cd cherrytree/build
cmake ../
make -j$(nproc --all)
./build/cherrytree

Install documentation:

sudo apt install devhelp libgtkmm-3.0-doc libgtksourceviewmm-3.0-doc libglibmm-2.4-doc libpangomm-1.4-doc libxml++2.6-doc libgspell-1-doc

devhelp

xdg-open /usr/share/doc/libgtkmm-3.0-doc/reference/html/index.html
xdg-open /usr/share/doc/libgtksourceviewmm-3.0-doc/reference/html/index.html
xdg-open /usr/share/doc/libglibmm-2.4-doc/reference/html/index.html
xdg-open /usr/share/doc/libpangomm-1.4-doc/reference/html/index.html
xdg-open /usr/share/doc/libxml++2.6-doc/reference/html/index.html
xdg-open /usr/share/doc/libgspell-1-dev/html/index.html



#!/bin/bash
set -e

curl -s https://gist.githubusercontent.com/danielwestendorf/cda938b1ffb0a203ec3a415079d56efa/raw/a99d03110521fb3c1a21e0412614831a96b024ea/writebook-to-pdf > /tmp/writebook-to-pdf
docker run -d -p 5001:5001 --name breezy-pdf-lite -e "DEBUG=breezy-pdf-lite:*" -e "PORT=5001" -e "PRIVATE_TOKEN=YOURSUPERSECRETTOKEN" danielwestendorf/breezy-pdf-lite:latest

echo "Try: ruby /tmp/writebook-to-pdf export https://books.37signals.com/2/the-writebook-manual"

#!/bin/sh
# Build the image
docker build . -t curler

# Run the new curler image with the correct flags and input helsinki.fi into it. 
docker run -it curler
#input 'helsinki.fi'

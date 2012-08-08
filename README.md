BackMasked
==========

Backmasked is a sound reversing and processing web application

sudo apt-get install sox libsox-fmt-mp3

# Reverse a whole song
sox <input.mp3> <output.mp3> reverse 

# Reverse a clip
sox <input.mp3> <output.mp3> trim <starting_time> <offset> reverse.

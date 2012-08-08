BackMasked
==========

Backmasked is a sound reversing and processing web application

sudo apt-get install sox libsox-fmt-mp3

Reverse a whole song
<code>sox input.mp3 output.mp3 reverse</code>

Reverse a clip
<code>sox input.mp3 output.mp3 trim 0 10 offset reverse</code>

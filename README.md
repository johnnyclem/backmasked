# BackMasked
BackMasked is a sound reversing and processing web application.

## Dependencies

### sox
In order to use BackMasked, your server should have <strong>sox</strong> installed. If you are running
<strong>BackMasked</strong> locally in a Ubuntu/Debian distribution, you can use the following command to 
install <strong>sox</strong> with mp3 support.

For more information on sox, <a href="http://sourceforge.net/projects/sox/">click here</a>.

<code>sudo apt-get install sox libsox-fmt-mp3</code>

#### Understanding and Using Sox
The following commands can be used to reverse a song or clip

#### Reverse a whole song
To reverse an entire song:
<code>sox input.mp3 output.mp3 reverse</code>

#### Reverse a clip
To reverse just a clip, you can use the trim command. The first param for trim is the 
starting point in seconds, the second param is an offset. So 0 10 is 10 seconds from 
the beginning of a file, 30 5 is 5 seconds starting from 30 seconds into the file.
<code>sox input.mp3 output.mp3 trim 0 10 reverse</code>

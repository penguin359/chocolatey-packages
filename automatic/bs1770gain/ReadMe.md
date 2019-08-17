# [BS1770GAIN](https://chocolatey.org/packages/bs1770gain)

Audio from different sources can be expected to be different loud and it would be nice to automatically adapt all these audio sources to the same loudness. Fortunately the ITU-R in their BS.1770 standard defines an algorithm which makes it possible to measure the loudness of a certain audio source. Based on the ITU-R BS.1770 measure several standards bodys defined what they think is the preferred loudness audio should normalize to, notably

- [EBU R128](https://tech.ebu.ch/loudness) (Europe) says -23.0,
- [ATSC A/85](http://www.atsc.org/cms/index.php/standards/recommended-practices/185-a85-techniques-for-establishing-and-maintaining-audio-loudness-for-digital-television) (Northern America) says -24.0, and
- [ReplayGain 2.0] says -18.0.
BS1770GAIN implements the ITU-R BS.1770 loudness measurement algorithm and makes it accessable to a user in several ways as known from the EBU R128 standard, i.e.
- measurement of the *integrated loudness,*
- measurement of the *maximum shortterm loudness,*
- measurement of the *maximum momentary loudness,* and
- measurement of the *loudness range.*
The integrated loudness is the two phase gated measurement of the mean loudness as described by ITU-R BS.1770. All measures are described in detail by EBU R128.

On top of that BS1770GAIN provides to additional measures not related to loudness:

- measurement of the *maximum sample peak* (ordinary peak), and
- measurement of the *maximum true peak* (peak due to upsampling).
Besides measuring the loudness BS1770GAIN is also able to adapt it conformant with the above mentioned statndards. There are two ways to achieve this:

- write REPLAYGAIN tags with the respective information to the file and leave the task of applying the gain to the playback device, or
- actually apply the gain.

## [Usage](http://bs1770gain.sourceforge.net/#usage)
## [Command-line syntax](http://bs1770gain.sourceforge.net/#cli)
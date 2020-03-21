# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/beets/beets.png" width="48" height="48"/> [Beets](https://chocolatey.org/packages/beets)

Beets is the media library management system for obsessive music geeks.

The purpose of beets is to get your music collection right once and for all.
It catalogs your collection, automatically improving its metadata as it goes.
It then provides a bouquet of tools for manipulating and accessing your music.

Here's an example of beets' brainy tag corrector doing its thing:
``
  $ beet import ~/music/ladytron
  Tagging:
      Ladytron - Witching Hour
  (Similarity: 98.4%)
   * Last One Standing      -> The Last One Standing
   * Beauty                 -> Beauty*2
   * White Light Generation -> Whitelightgenerator
   * All the Way            -> All the Way...``

Because beets is designed as a library, it can do almost anything you can
imagine for your music collection. Via [plugins](https://beets.readthedocs.org/page/plugins), beets becomes a panacea:

- Fetch or calculate all the metadata you could possibly need: [album art](https://beets.readthedocs.org/page/plugins/fetchart.html),
  [lyrics](https://beets.readthedocs.org/page/plugins/lyrics.html), [genres](https://beets.readthedocs.org/page/plugins/lastgenre.html), [tempos](https://beets.readthedocs.org/page/plugins/acousticbrainz.html), [ReplayGain](https://beets.readthedocs.org/page/plugins/replaygain.html) levels, or [acoustic
  fingerprints](https://beets.readthedocs.org/page/plugins/chroma.html).
- Get metadata from [MusicBrainz](https://musicbrainz.org), [Discogs](https://www.discogs.com/), and [Beatport](https://www.beatport.com/). Or guess
  metadata using songs' filenames or their acoustic fingerprints.
- [Transcode audio](https://beets.readthedocs.org/page/plugins/convert.html) to any format you like.
- Check your library for `duplicate tracks and albums`_ or for [albums that
  are missing tracks](https://beets.readthedocs.org/page/plugins/missing.html).
- Clean up crufty tags left behind by other, less-awesome tools.
- Embed and extract album art from files' metadata.
- Browse your music library graphically through a Web browser and play it in any
  browser that supports [HTML5 Audio](http://www.w3.org/TR/html-markup/audio.html).
- Analyze music files' metadata from the command line.
- Listen to your library with a music player that speaks the [MPD](https://www.musicpd.org) protocol
  and works with a staggering variety of interfaces.

If beets doesn't do what you want yet, [writing your own plugin](https://beets.readthedocs.org/page/dev/plugins.html) is
shockingly simple if you know a little Python.
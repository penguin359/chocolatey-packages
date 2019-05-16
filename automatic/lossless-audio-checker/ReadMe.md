# <img src="https://cdn.jsdelivr.net/gh/chtof/chocolatey-packages/automatic/lossless-audio-checker/lossless-audio-checker.png" width="48" height="48"/> [Lossless Audio Checker](https://chocolatey.org/packages/lossless-audio-checker)

## Overview
Internet music dealers currently sell CD-Quality tracks, or even better (Studio-Master), thanks to lossless audio coding formats (FLAC, ALAC). However, a lossless format does not guarantee that the audio content is what it seems to be. The audio signal may have been upscaled (increasing the resolution), upsampled (increasing the sampling rate) or even transcoded from a lossy to a lossless format. Lossless Audio Checker analyzes lossless audio tracks and detects upscaling, upsampling and transcoding.

## Research papers
2015-10-30: Julien Lacroix, Yann Prime, Alexandre Remy, Olivier Derrien, [Lossless Audio Checker: A Software for the Detection of Upscaling, Upsampling, and Transcoding in Lossless Musical Tracks](http://www.aes.org/e-lib/browse.cfm?elib=17972). 139th International Audio Engineering Society Convention (AES), New York.
2019-02-27: Olivier Derrien, [Detection of Genuine Lossless Audio Files: Application to the MPEG-AAC Codec](http://www.aes.org/e-lib/browse.cfm?elib=19892). Journal of the Audio Engineering Society (JAES) Volume 67 Issue 3 pp. 116-123. See here for open access version.

## Detection algorithms
- Upscaling
- Upsampling
- AAC-SIN Transcoding: AAC tracks, encoded using sine windows, transcoded to a lossless format
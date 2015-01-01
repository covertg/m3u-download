#playmusic-download

This script works in conjunction with [GMusicProxy](http://gmusicproxy.net/) to download the songs in an .m3u stream, maintaining album art and ID3 tags. Tested on OS X 10.10, but should work elsewhere.

Although it was intended for Google Play, it may work with other .m3u files, too.

## Requirements
  * A working setup of GMusicProxy. See the website for instructions.
  * That's about it. Basic bash knowledge and a working curl installation?

## Basic Usage
```bash
$ download.sh <filename.m3u> <outputdir>
```
Output:
```bash
Making folder <outputdir>

1/TOTAL Downloading <Artist> - <Title>
...
TOTAL/TOTAL Downloading <Artist> - <Title>

All songs downloaded.
```

## Example
With `gmusicproxy` running, find a playlist you wish to download:
```bash
$ curl localhost:9999/get_all_playlists
```
Output:
```
#EXTM3U
...
#EXTINF:-1,Playlist I Want
http://localhost:9999/get_playlist?id=123ab456-1111-2222-3333-7c890d12efgh
...
```
Download that playlist as an .m3u:
```bash
$ curl -o ~/path/playlist-i-want.m3u http://localhost:9999/get_playlist?id=123ab456-1111-2222-3333-7c890d12efgh
```
Download the playlist to .mp3's using `download.sh`:
```bash
$ ./download.sh ~/path/playlist-i-want.m3u ~/path/to/save/files
```
Sit back and wait till the download completes.

## Notes (READ ME)
  * **This script is intended for personal use only.**
  * It only works on M3U streams that list the songs themselves, not streams that list other lists. For example, it cannot download the M3U returned from GMusicProxy's `get_all_playlists`, because it contains a list of other lists.

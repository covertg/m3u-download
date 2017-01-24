#m3u-download

This will batch download songs from an M3U stream. Tested on OSX 10.10, but it should work anywhere with with a bash-compatible shell. The only other requirement is a working curl installation!

## Notes (READ ME)
  * **This script is intended for personal use only.** Please use it ethically; don't go downloading content that isn't yours.
  * This only works on M3U streams that list the songs themselves, not streams that list other lists. (For example, this cannot download the M3U returned from GMusicProxy's `get_all_playlists`, because it only contains a list of other lists.)
  * Distributed under MIT license.

## Basic Usage
```bash
$ download.sh <filename.m3u> <outputdir>
```
Output:
```bash
Making folder <outputdir>.

1/TOTAL		Downloading <Artist> - <Title>
...
TOTAL/TOTAL	Downloading <Artist> - <Title>

All songs downloaded.
```

## Example with GMusicProxy
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

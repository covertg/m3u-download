# m3u-download

This will batch download songs from an M3U stream. Tested on Linux and macOS 10.10, but it should work anywhere with with a bash-compatible shell. The only other requirement is a working curl installation!

## Know before you go

  * **This script is intended for personal use only.** Use it ethically for content which is yours to download.
  * `m3u-download` currently only works on M3U streams that list songs themselves; it can't handle streams that list other lists. (For example, when testing with GMusicProxy, `/get_all_playlists` won't play nice because it only contains a list of other lists.)
  * Distributed under MIT license. Pull requests welcome!

## Usage

```bash
$ ./download.sh <path/playlist.m3u> <path/outputdir>
```

Output:
```bash
Making folder <outputdir>.

1/TOTAL		Downloading <Artist> - <Title>
...
TOTAL/TOTAL	Downloading <Artist> - <Title>

All songs downloaded.
```

*Note*: if the download seems to fail or end prematurely, try appending `--ignore-content-length` to the end of `m3u-download`'s cURL argument. See [#2](https://github.com/covertg/m3u-download/pull/2).

### (Old) Example with GMusicProxy

With `gmusicproxy` running, find a playlist you wish to download:

```bash
$ curl localhost:9999/get_all_playlists
#EXTM3U
...
#EXTINF:-1,Playlist I Want
http://localhost:9999/get_playlist?id=123ab456-1111-2222-3333-7c890d12efgh
...
```

Download that playlist as an .m3u:
```bash
$ curl -o path/playlist-i-want.m3u http://localhost:9999/get_playlist?id=123ab456-1111-2222-3333-7c890d12efgh
```

Now call in `m3u-download`:
```bash
$ ./download.sh path/playlist-i-want.m3u path/outputdir
```

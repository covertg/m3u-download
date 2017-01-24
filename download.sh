#!/bin/bash
set -ue

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. <3

usage() {
    echo "Usage:" >&2
    name=${i:-'download.sh'}
    echo "Usage: $name path/to/playlist.m3u path/to/output-directory" >&2
    exit 1
}

if [ -z "${1:+x}" ]; then
    echo "No playlist file provided." >&2
    usage
fi

if [ -z "${2+x}" ]; then
    echo "Output directory not set." >&2
    usage
fi

playlist=$1
outputdir=${2%/}

if [ ! -d $outputdir ]; then
	echo -e "Making folder $outputdir.\n"
	mkdir -p $outputdir
fi

declare -i lines=$(wc -l < $playlist)
declare -i songs=($lines-1)/2

for ((song = 1; song <= $songs; song++)); do
	songtitle="$(awk "NR==$song*2 {print}" $playlist | cut -d',' -f2-)"
	songtitle=${songtitle//\//-}
	echo -e "$song/$songs\tDownloading $songtitle"
	
	songlink="$(awk "NR==$song*2+1 {print}" $playlist)"
	curl -o "$outputdir/$song $songtitle.mp3" -s $songlink --ignore-content-length
done

echo -e "\nAll songs downloaded."

#!/run/current-system/sw/bin/bash
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM
BARS=8;
FRAMERATE=60;
EQUILIZER=1;
while getopts 'b:f:m:eh' flag; do
    case "${flag}" in
        b) BARS="${OPTARG}" ;;
        f) FRAMERATE="${OPTARG}" ;;
        e) EQUILIZER=0 ;;
        h)
            echo "caway usage: caway [ options ... ]"
            echo "where options include:"
            echo
            echo "  -b <integer>  (Number of bars to display. Default 8)"
            echo "  -f <integer>  (Framerate of the equilizer. Default 60)"
            echo "  -e            (Disable equilizer. Default enabled)"
            echo "  -h            (Show help message)"
            exit 0
            ;;
    esac
done
bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1} /g;"
    i=$((i=i+1))
done
dict="${dict}s/.$//;"
clean_create_pipe() {
    if [ -p $1 ]; then
        unlink $1
    fi
    mkfifo $1
}
kill_pid_file() {
    if [[ -f $1 ]]; then
        while read pid; do
            { kill "$pid" && wait "$pid"; } 2>/dev/null
        done < $1
    fi
}
cava_waybar_pid="/tmp/cava_waybar_pid"
cava_waybar_pipe="/tmp/cava_waybar.fifo"
clean_create_pipe $cava_waybar_pipe
cava_waybar_config="/tmp/cava_waybar_config"
echo "
[general]
mode = normal
framerate = $FRAMERATE
bars = $BARS
[output]
method = raw
raw_target = $cava_waybar_pipe
data_format = ascii
ascii_max_range = 7
" > $cava_waybar_config
playerctl_waybar_pipe="/tmp/playerctl_waybar.fifo"
clean_create_pipe $playerctl_waybar_pipe
playerctl -a metadata --format '{"text": "{{title}} - {{artist}}", "tooltip": "{{playerName}} : {{markup_escape(title)}} - {{markup_escape(artist)}}", "alt": "{{status}}", "class": "{{status}}"}' -F >$playerctl_waybar_pipe &
while read -r line; do
    kill_pid_file $cava_waybar_pid
    echo "$line" | jq --unbuffered --compact-output
    if [[ $EQUILIZER == 1 && $(echo $line | jq -r '.class') == 'Playing' ]]; then
        sleep 2
        cava -p $cava_waybar_config >$cava_waybar_pipe &
        echo $! > $cava_waybar_pid
        while read -r cmd2; do
            echo "$line" | jq --arg a $(echo $cmd2 | sed "$dict") '.text = $a' --unbuffered --compact-output
        done < $cava_waybar_pipe & 

        echo $! >> $cava_waybar_pid
    fi
done < $playerctl_waybar_pipe

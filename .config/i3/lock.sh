#!/bin/bash
scrot /tmp/screen.png
ICON="/home/huaq/.config/i3/1.png"
TMPBG=/tmp/screen.png
convert $TMPBG -blur 0x5 $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG

resolutionX=$(xrandr | grep -o -e 'current [0-9]* x [0-9]*' | awk '{print $2}')
resolutionY=$(xrandr | grep -o -e 'current [0-9]* x [0-9]*' | awk '{print $4}')
wordPixel=100
wordNum=$[$(wc -m ./lockWord.txt | awk '{print $1}')-1]
echo $wordNum
wordPosX=$[$[resolutionX/2]-$[$[wordNum*wordPixel]/4]]
wordPosY=$[resolutionY-$[wordlPixel*4]]
echo $wordPosX
echo $wordPosY
convert $TMPBG -font WenQuanYi-Micro-Hei -fill red -pointsize $wordPixel -annotate +$wordPosX+$wordPosY @lockWord.txt $TMPBG

i3lock -u -i $TMPBG
rm /tmp/screen.png

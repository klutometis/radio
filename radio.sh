#!/usr/bin/env bash

# [[file:~/radio/TODO.org::*Associative%20arrays][Associative-arrays:1]]

declare -A stations

# Specify a player with the environment variable PLAYER; otherwise,
# we'll take mplayer.
player=${PLAYER:-mplayer -playlist}

# Domain knowledge lives here.
stations=(
    [kcme]='http://www.kcme.org/Audio%20Players/Broadband/listen.pls'
    [kcnv]='http://66.209.79.122:81/liveaudio/KCNVstream.ram'
    [kcsc]='http://stream.uco.edu/ramgen/broadcast/kcscfm/kcscfm.rm'
    [kdfc]='http://den-a.plr.liquidcompass.net/pls/KDFCFM.pls'
    [kfuo]='http://streams.classic99.com/classic99.asx'
    [king]='http://filesource.abacast.com/king/mp3.m3u'
    [knau]='http://www.publicbroadcasting.net/knau/ppr/knau.m3u'
    [kosu]='http://kosu.org/wp-content/themes/KOSU/audio/KOSU-2.m3u'
    [kuat]='http://streaming.azpm.org/kuat192.mp3.m3u'
    [kusc]='http://kuscstream.org/pls/kusc128.pls'
    [kvno]='http://kvnovm-hd1.unomaha.edu:8000/listen.pls'
    [kvpr]='http://www.kvpr.org/sites/kvpr/files/streaming/kvpr_0.m3u'
    [kwax]='http://184.171.104.41:8000/listen.pls?sid=5%22'
    [sdpb]='http://www.sdpb.org/player/radio2-livestream.asx'
    [wabe]='http://pba-ice.streamguys.org/wabe.m3u'
    # Needs the no-playlist option.
    # [waus]='mms://livestream.andrews.edu/waus-28'
    [wbaa]='http://audio-new.wbaa.purdue.edu:8000/wbaa-fm.m3u'
    [wbjc]='http://wbjc-sc.streamguys.org/listen.pls'
    [wclv]='http://www2.wclv.com/wclvhi.m3u'
    [wcpe]='http://www.ibiblio.org/wcpe/wcpe.pls'
    [wdav]='http://www.wdav.org/streams/wdav-128k.m3u'
    [wdpr]='http://www.abacast.com/media/pls/wdpr/wdpr-live-96.pls'
    [weku]='http://publicbroadcasting.net/weku/ppr/weku2itunes.pls'
    [weta]='http://stream.weta.org:8004/listen.pls'
    [wfcr]='http://www.publicbroadcasting.net/wfcr/ppr/wfcr.pls'
    [wfmt]='http://www.wfmt.com/res/streaming/live/spex2012/wfmtstream.pls'
    [wgbh]='http://audio.wgbh.org/otherWaysToListen/classicalNewEngland.m3u'
    [wgte]='http://www.wgte.org/wgte/wgte.pls'
    [wguc]='http://cpr2.streamguys.net/wguc'
    [whfr]='http://whfr.fm/sites/default/whfr.m3u'
    [whqr]='http://whqr.org/sites/whqr/files/streaming/whqr_hd2_0.m3u'
    [whrb]='http://hrbinc-low.streamguys.net/listen.pls'
    [whro]='http://www.whro.org/home/html/liveradio/whro.wax'
    [wiaa]='http://www.publicbroadcasting.net/wiaa/ppr/wiaa.pls'
    [witf]='http://witf.ic.llnwd.net/stream/witf_witfmusic24_mp3.pls'
    [wkar]='http://wkar.org/sites/wkar/files/streaming/classical_0.m3u'
    [wksu]='http://www.wksu.org/listen/classical.pls'
    [wmht]='http://live.str3am.com:2070/listen.pls'
    [wmnr]='http://data.instantencore.com/repository/wmnr/wmnr56k.pls'
    [wned]='http://www.publicbroadcasting.net/wned/ppr/wnedfm.pls'
    [wosu]='http://streaming3.osu.edu:8010/listen.pls'
    [wpr]='http://wpr-ice.streamguys.net/wpr-hd2-mp3-96.m3u'
    [wprb]='http://listen.wprb.com/'
    [wqed]='http://www.wqed.org/fm/wqed_fm_mp3.pls'
    [wqxr]='http://www.wqxr.org/stream/wqxr/mp3.pls'
    [wrcj]='http://www.wrcjfm.org/listen.pls'
    [wrek]='http://streaming.wrek.org:8000/wrek_live-128kb.m3u'
    [wrr]='http://icy3.abacast.com/wrr-wrr101aac-128.m3u'
    [wrti]='http://www.publicbroadcasting.net/wrti/ppr/wrti.m3u'
    [wuft]='http://www.wuft.org/stream/wuft-fm-hd2-high.pls'
    [wuol]='http://lpm.streamguys.tv/lpm128-2.m3u'
    [wuot]='http://mp3streamer.wuot.org:8000/wuotwide.m3u'
    [wwfm]='http://asx.abacast.com/wwfm-classicalsc-128.pls'
    [wxxi]='http://wxxi.org/podcast/fm-hi.m3u'
    [wypr]='http://wypr-ice.streamguys.com/wypr-hd3.m3u'
    [wysu]='http://live.wysu.org:3180/hd2.m3u'
    [xlnc1]='http://www.xlnc1.org/live365/winamp.pls'
    [vpr]='http://www.vpr.net/vpr_files/stream_playlists/vprclassicalhigh.pls'
    [bartók]='http://stream001.radio.hu/mr3.m3u'
    [bayern]='http://streams.br-online.de/br-klassik_2.m3u'
    [bulgaria]='http://ng.btv.bg/m3u/classicfm.m3u'
    [medieval]='http://streaming.virtualpro.hu/tunein.php/ceu/playlist.pls'
    [mdr]='http://avw.mdr.de/livestreams/mdr_klassik_live_128.m3u'
    [mdr-concert]='http://avw.mdr.de/livestreams/mdr_figaro_classic_128.m3u'
    [ndr]='http://www.ndr.de/resources/metadaten/audio/m3u/ndrkultur.m3u'
    [latvia]='http://lr3mp0.latvijasradio.lv:8006/listen.pls'
    [oe1]='http://mp3stream3.apasf.apa.at:8000/listen.pls'
    [romania]='http://web.srr.ro/cgi/my.pl?arg=/stream/online&id=16'
    [swiss]='http://www.radioswissclassic.ch/live/aacp.m3u'
    [stephansdom]='http://srvhost24.serverhosting.apa.net:8000/rsdstream128.m3u'
    [wdr]='http://www.wdr.de/wdrlive/media/wdr3.m3u'
)

# If a playlist isn't specified, take all the stations.
playlist=${@:-${!stations[@]}}

# Shuffle the playlist and play.
for station in $(echo $playlist | xargs shuf -e); do
    echo $station
    $player "${stations[$station]}"
done

# Associative-arrays:1 ends here

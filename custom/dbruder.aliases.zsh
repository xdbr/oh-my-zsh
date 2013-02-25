alias screen="screen -U"
# alias ssh=':& a=$! ; port=$(( $a%45536 +20000 )) AUTOSSH_GATETIME=30 AUTOSSH_POLL=15 autossh -M $port'
# alias ssh='export AUTOSSH_PORT=0; export AUTOSSH_GATETIME=30; export AUTOSSH_POLL=15; autossh'
alias ma="cd ~/ma/build; time make ma && open ../text/MA.pdf"
alias sis="cd ~/ma; ./configure; cd ~/ma/build; time make -j4"
alias maw="( ma ) 2>&1 | perl -ne 'print if /full|warning/i' | sort | uniq"
alias cv="cd ~/Documents/CV"
alias flv2mp3="ruby /usr/local/self/FLV-to-MP3-parser/code.rb"

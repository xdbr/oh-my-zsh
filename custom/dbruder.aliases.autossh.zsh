
# About: This is a small script I wrote for myself to make 
# connection using autossh a little easier, i.e.
# especially as far as ports to use are concerned
#
# Warning: This is zsh-specific!!!
#
# Written by: Daniel Bruder <bruder@cip.ifi.lmu.de>
#
# TODO:
#   * Check if connection already exists, port is taken, before opening a second connection


typeset -A HOST_PORT
typeset -A FULL_HOST
typeset -A HOST_USER

HOST_PORT=(
    butterpilz  22222
    crux        52195
    diener      22223
    calculus    22555
)

FULL_HOST=(
    butterpilz  cip.ifi.lmu.de
    crux        uberspace.de
    diener      cis.uni-muenchen.de
    calculus    cis.uni-muenchen.de
)

HOST_USER=(
    butterpilz  bruder
    crux        dbrx
    diener      bruder
    calculus    bruder
)

# Unless already exported, export now
[[ -z $AUTOSSH_POLL ]] && export AUTOSSH_POLL=5

assh () {
    if [[ -z "$@" ]]; then  # If no arguments are given
        echo 'Select your host:'
        PS3='host? '
        select HOST in ${(k)HOST_PORT}; do
            AUTOSSH_POLL=$AUTOSSH_POLL autossh -M ${HOST_PORT[$HOST]} ${HOST_USER[$HOST]}@$HOST.${FULL_HOST[$HOST]}
        done
    else
        HOST=$1; shift
        PORT=${HOST_PORT[$HOST]}
        [[ -z $PORT ]] && echo "Port to use for host $HOST is not known. Aborting." && return
        AUTOSSH_POLL=$AUTOSSH_POLL autossh -M ${HOST_PORT[$HOST]} ${HOST_USER[$HOST]}@$HOST.${FULL_HOST[$HOST]}
        # return
        # AUTOSSH_POLL=$AUTOSSH_POLLTIME autossh -M $PORT $HOST
    fi
}
# AUTOSSH_POLL=5 autossh -M 22222 bruder@calculus.cis.uni-muenchen.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@eselsohr.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@remote.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@Perlpilz.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@moenchskopf.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@birkenpilz.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@perlpilz.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22333 dbruder@82.135.40.187
# AUTOSSH_POLL=5 autossh -M 22666 dbr@mono.local
# AUTOSSH_POLL=5 autossh -M 22555 bruder@calculus.cis.uni-muenchen.de
# AUTOSSH_POLL=5 autossh -M 22445 dbrx@codeedition.de
# AUTOSSH_POLL=5 autossh -M 22444 dbrx@codeedition.de
# AUTOSSH_POLL=5 autossh -M 22446 dbrx@crux.uberspace.de
# AUTOSSH_POLL=5 autossh -M 22444 dbrx@crux.uberspace.de
# AUTOSSH_POLL=5 autossh -M 22445 dbrx@crux.uberspace.de
# AUTOSSH_POLL=5 autossh -M 22555 bruder@diener.cis.uni-muenchen.de
# AUTOSSH_POLL=5 autossh -M 22222 bruder@butterpilz.cip.ifi.lmu.de
# AUTOSSH_POLL=5 autossh -M 22223 dbrx@crux.uberspace.de
# AUTOSSH_POLL=5 autossh -M 52195 dbrx@crux.uberspace.de
# AUTOSSH_POLL=5 autossh -M 22223 bruder@diener.cis.uni-muenchen.de
# AUTOSSH_POLL=5 autossh -M 22222 butterpilz
# AUTOSSH_POLL=5 autossh -M 52196 dbrx@crux.uberspace.de

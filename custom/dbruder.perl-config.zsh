# # # PERL CONFIG # # #
#
# local::lib
#
# export PERL_LOCAL_LIB_ROOT="/Users/dbruder/perl5";
# export PERL_MB_OPT="--install_base /Users/dbruder/perl5";
# export PERL_MM_OPT="INSTALL_BASE=/Users/dbruder/perl5";
# export PATH="/Users/dbruder/perl5/bin:$PATH";

#
# perlbrew
#
export PERL_CPANM_OPT="--prompt --interactive --verbose --mirror http://cpan.cpantesters.org"

# Speed up tests when installing perl / perl modules
export MACHINE_CORES=`system_profiler SPHardwareDataType | grep Cores | perl -ape '$_=$F[-1]+1'`
# export TEST_JOBS=$MACHINE_CORES
# export HARNESS_OPTIONS=c:j$MACHINE_CORES make test
export TEST_JOBS=5
export HARNESS_OPTIONS=c:j5 make test

# export PERL5LIB="/Users/dbruder/perl5/lib/perl5:/Users/dbruder/perl5/lib/perl5/darwin-2level:/Users/dbruder/perl5/lib/perl5:$PERL5LIB";

source ~/perl5/perlbrew/etc/bashrc

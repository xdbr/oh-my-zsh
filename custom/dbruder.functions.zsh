gcoam() {   # automatically git-commit like this: git commit -am '[branch-name] message'
    perl -e '$b=(map{split q" "}grep q"*",`git branch`)[-1]; exec qq<git commit -am "[$b] @ARGV">' "$@"
}

gdbtool() { emacs --eval "(gdb --annotate=3; --args $* \")";}

mkbook() {
    psbook -q $1 | pstops '4:1L@.7(21cm,14.85cm)+0L@.7(21cm,0),2R@.7(0cm,29cm)+3R@.7(0cm,14.85cm)'
}

o() {
    dir=${1-.}
    open $dir
}

m() {
    dir=${1-.}
    mate $dir
}
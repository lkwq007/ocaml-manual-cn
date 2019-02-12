# inspired by https://gist.github.com/avsm/6757425

OPAM_DEPENDS="hevea"

export OPAMYES=1
export OPAMVERBOSE=1
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version

opam init 
opam install ${OPAM_DEPENDS}
eval `opam config env`
make
eval `opam config env`
make
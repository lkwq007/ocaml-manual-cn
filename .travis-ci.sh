# inspired by https://gist.github.com/avsm/6757425

OPAM_DEPENDS="hevea"

echo "yes" | sudo add-apt-repository ppa:avsm/ppa
echo "yes" | sudo add-apt-repository ppa:jonathonf/texlive
sudo apt-get update -qq
sudo apt-get install -qq ocaml ocaml-native-compilers camlp4-extra opam texlive-full
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
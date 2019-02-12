# inspired by https://gist.github.com/avsm/6757425

OPAM_DEPENDS="hevea"

echo "yes" | sudo add-apt-repository ppa:jonathonf/texlive
sudo apt-get update -y
sudo apt-get install -y curl build-essential m4 zlib1g-dev libssl-dev ocaml ocaml-native-compilers opam texlive-full
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
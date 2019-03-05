# inspired by https://gist.github.com/avsm/6757425

# hevea
OPAM_DEPENDS="hevea"

# info
export OPAMYES=1
export OPAMVERBOSE=1
echo OCaml version
ocaml -version
echo OPAM versions
opam --version
opam --git-version

# init opam
opam init 
opam install ${OPAM_DEPENDS}
eval `opam config env`

# rm .gitignore of htmlman
cd manual/htmlman
rm .gitignore
cd ../..
make
# this part should not be put in the before_deploy part
mkdir release
{
  REFMAN_VERSION=`git describe --abbrev=0 --tags` &&
  export RELEASENAME="ocaml-${REFMAN_VERSION}-"
} || { 
  export RELEASENAME=""
}
make release
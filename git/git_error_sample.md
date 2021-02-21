# ERROR

the remote end hung up unexpectedly, early EOF, index-pack failed

  try n°1
git config --global http.postBuffer 524288000
git config --global core.compression 9

  try n°2
git config --global core.compression 0
git clone --depth 1 <repo_URI>
  cd repo_URL
git fetch --unshallow  OR git fetch --depth=2147483647
  then
git pull --all

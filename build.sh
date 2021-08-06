version="v20210701"
release_name="brook"
repo="txthinking/brook"

get_releases(){
    cd ${version}
    links=`curl https://api.github.com/${repo}/releases | grep https://github.com/${repo}/releases/download/${version} | awk '{print $2}'`
    echo links | while read link
    do
        wget ${link} -O ${version}
    done
    zip -9 BrookLite.exe.zip rookLite.exe
    cd ..
}

update(){
    git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git config --local user.name "github-actions[bot]"
    git add ${version}/*
    git commit -m ${version}
    git push
}

set -ex
rm -rf ${version}
mkdir ${version}
get_releases
update

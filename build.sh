version="v20210701"
release_name="brook"
repo="https://github.com/txthinking/brook"

build(){
    CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build                    -ldflags="-w -s" -o ../${version}/${release_name}_darwin_amd64 $1
    CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build                    -ldflags="-w -s" -o ../${version}/${release_name}_darwin_arm64 $1
    CGO_ENABLED=0 GOOS=freebsd GOARCH=386 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_freebsd_386 $1
    CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build                   -ldflags="-w -s" -o ../${version}/${release_name}_freebsd_amd64 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_linux_amd64 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=386 go build                       -ldflags="-w -s" -o ../${version}/${release_name}_linux_386 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_linux_arm64 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build               -ldflags="-w -s" -o ../${version}/${release_name}_linux_arm7 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=6 go build               -ldflags="-w -s" -o ../${version}/${release_name}_linux_arm6 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=5 go build               -ldflags="-w -s" -o ../${version}/${release_name}_linux_arm5 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips go build                      -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mipsle go build                    -ldflags="-w -s" -o ../${version}/${release_name}_linux_mipsle $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips GOMIPS=softfloat go build     -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips_softfloat $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mipsle GOMIPS=softfloat go build   -ldflags="-w -s" -o ../${version}/${release_name}_linux_mipsle_softfloat $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips64 go build                    -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips64 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips64le go build                  -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips64le $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips64 GOMIPS=softfloat go build   -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips64_softfloat $1
    CGO_ENABLED=0 GOOS=linux GOARCH=mips64le GOMIPS=softfloat go build -ldflags="-w -s" -o ../${version}/${release_name}_linux_mips64le_softfloat $1
    CGO_ENABLED=0 GOOS=linux GOARCH=ppc64 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_linux_ppc64 $1
    CGO_ENABLED=0 GOOS=linux GOARCH=ppc64le go build                   -ldflags="-w -s" -o ../${version}/${release_name}_linux_ppc64le $1
    CGO_ENABLED=0 GOOS=netbsd GOARCH=386 go build                      -ldflags="-w -s" -o ../${version}/${release_name}_netbsd_386 $1
    CGO_ENABLED=0 GOOS=netbsd GOARCH=amd64 go build                    -ldflags="-w -s" -o ../${version}/${release_name}_netbsd_amd64 $1
    CGO_ENABLED=0 GOOS=openbsd GOARCH=386 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_openbsd_386 $1
    CGO_ENABLED=0 GOOS=openbsd GOARCH=amd64 go build                   -ldflags="-w -s" -o ../${version}/${release_name}_openbsd_amd64 $1
    CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build                   -ldflags="-w -s" -o ../${version}/${release_name}_windows_amd64.exe $1
    CGO_ENABLED=0 GOOS=windows GOARCH=386 go build                     -ldflags="-w -s" -o ../${version}/${release_name}_windows_386.exe $1

    cd ipk

    cp ../../${version}/brook_linux_amd64 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}brook_linux_amd64.ipk

    cp ../../${version}/brook_linux_386 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_386.ipk

    cp ../../${version}/brook_linux_arm64 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_arm64.ipk

    cp ../../${version}/brook_linux_arm7 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_arm7.ipk

    cp ../../${version}/brook_linux_arm6 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_arm6.ipk

    cp ../../${version}/brook_linux_arm5 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_arm5.ipk

    cp ../../${version}/brook_linux_mips data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips.ipk

    cp ../../${version}/brook_linux_mipsle data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mipsle.ipk

    cp ../../${version}/brook_linux_mips_softfloat data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips_softfloat.ipk

    cp ../../${version}/brook_linux_mipsle_softfloat data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mipsle_softfloat.ipk

    cp ../../${version}/brook_linux_mips64 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips64.ipk

    cp ../../${version}/brook_linux_mips64le data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips64le.ipk

    cp ../../${version}/brook_linux_mips64_softfloat data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips64_softfloat.ipk

    cp ../../${version}/brook_linux_mips64le_softfloat data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_mips64le_softfloat.ipk

    cp ../../${version}/brook_linux_ppc64 data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_ppc64.ipk

    cp ../../${version}/brook_linux_ppc64le data/usr/bin/brook
    gsed -i 's/Architecture: .*/Architecture: all/' ./control/control
    ./build.sh
    mv brook.ipk ../../${version}/brook_linux_ppc64le.ipk
}

get_gui(){
    wget https://github.com/txthinking/brook/releases/latest/download/Brook.dmg -O ./${version}/Brook.dmg
    wget https://github.com/txthinking/brook/releases/latest/download/BrookLite.exe -O ./${version}/BrookLite.exe
    # wget https://github.com/txthinking/brook/releases/latest/download/Brook.apk -O Brook.apk
    # wget https://github.com/txthinking/brook/releases/latest/download/Brook.exe -O Brook.exe
    zip -9 BrookLite.exe.zip BrookLite.exe
}

update(){
    git config --local user.email "41898282+github-actions[bot]@users.noreply.github.com"
    git config --local user.name "github-actions[bot]"
    git add ${version}/*
    git commit -m ${version}
    git push
}

set -ex
[[ -d ${version} ]] && rm -rf ${version}
mkdir ${version}

git clone $repo && cd brook
build "./cli/brook"
cd ..
get_gui
update

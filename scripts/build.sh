#!/bin/sh

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



set -Ceu


cd $(dirname "$0")
DIRECTORY=$(cd .. && pwd)
BASENAME=$(basename "$DIRECTORY")

if [ -d "$DIRECTORY/build/release" ]; then
    rm -fr "$DIRECTORY/build/release"
fi

for OS in darwin linux windows
do
    OUTPUT_FILE=$BASENAME
    if [ "$OS" = "windows" ]; then
        OUTPUT_FILE=$OUTPUT_FILE.exe
    fi

    for ARCHITECTURE in amd64
    do
      GOOS=$OS GOARCH=$ARCHITECTURE go build -a -ldflags '-w -s -X main.revision=$(GIT_REVISION) -extldflags "-static"' \
          -o $DIRECTORY/build/release/$OS-$ARCHITECTURE/bin/$OUTPUT_FILE \
          $DIRECTORY/cmd/hello/hello.go
    done
done



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

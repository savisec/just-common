
# Build a specific cmd for specific platform (use "darwin" for mac)
[group('build')]
build-cmd cmd goos="linux" goarch="amd64":
    mkdir -p "{{ PROJECT_BIN }}"
    GOOS="{{ goos }}" GOARCH="{{ goarch }}" CGO_ENABLED=0 \
        go build -a \
        -ldflags '-s -w -extldflags=-static' \
        -tags lambda.norpc \
        -o "{{ PROJECT_BIN }}/{{ cmd }}" \
        "{{ justfile_dir() }}/cmd/{{ cmd }}"

[group('clean')]
clean:
    rm -rf "{{ PROJECT_BIN }}/"

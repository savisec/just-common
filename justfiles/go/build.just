
# Build a specific cmd for specific platform (use "darwin" for mac)
[group('build')]
build_cmd cmd goos="linux":
    mkdir -p "{{ PROJECT_BIN }}"
    GOOS="{{ goos }}" GOARCH=amd64 CGO_ENABLED=0 \
        go build -a \
        -ldflags '-s -w -extldflags=-static' \
        -o "{{ PROJECT_BIN }}/{{ cmd }}" \
        "{{ justfile_dir() }}/cmd/{{ cmd }}"

[group('clean')]
clean:
    rm -rf "{{ PROJECT_BIN }}/"

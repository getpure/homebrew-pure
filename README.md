# homebrew-pure — `brew install pure`

Official Homebrew tap for the [Pure CLI](https://pure.dev) — compile
TypeScript/JavaScript to native binaries via `api.pure.dev`.

## Install

```sh
brew tap getpure/pure
brew install pure
```

or, in one line:

```sh
brew install getpure/pure/pure
```

## Update

```sh
brew upgrade pure
```

## Status

Only macOS Apple Silicon (arm64) is supported.

## Unsigned build

The `pure` binary isn't code-signed or notarized yet. If macOS blocks it
as being from an "unidentified developer" the first time you run it, run:

```sh
xattr -d com.apple.quarantine "$(brew --prefix)/bin/pure"
```

## Updating the formula on release

`Formula/pure.rb`'s `version`, `url`(s), and `sha256`(s) are bumped
automatically on every macOS release.

## License

The `pure` CLI binary this tap installs is proprietary, closed-source
software — free to download and run, but not open source. See
[LICENSE](./LICENSE) for the actual terms. This has no bearing on
Pure's compiler, runtime, or API, which are separate, also-proprietary
software with their own terms.

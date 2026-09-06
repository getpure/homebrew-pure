# Homebrew formula for the Pure CLI.
#
# Tap: `brew tap getpure/pure && brew install pure`
# (or the one-liner: `brew install getpure/pure/pure`)
#
# This repo is `github.com/getpure/homebrew-pure` — matches Homebrew's
# `<org>/homebrew-<name>` convention exactly (org `getpure`, repo
# `homebrew-pure`, tap shorthand `getpure/pure`), so the bare/shorthand
# forms above resolve correctly with no explicit URL needed. PUBLIC
# GitHub, on purpose — `brew tap` needs to fetch this repo's formula over
# an anonymous clone; an internal/private GitLab tap (an earlier, since-
# superseded attempt lived at gitlab.com/pureinc/internal/homebrew-tap)
# can't be tapped by a customer's `brew` at all, private-repo auth aside.
#
# Points at the version-pinned tarballs published by
# internal/cli/scripts/publish-macos-to-r2.sh to the brew.pure.dev R2
# bucket — NOT pure_latest_* (those float; Homebrew needs a stable URL+sha256
# per release so `brew install` is reproducible and bottling/audits work).
#
# x86_64 (Intel) is NOT YET published (internal/cli's 'macos' CI publish
# group builds both arm64 and x86_64, but only the arm64 leg has actually
# been run) — omitted rather than faked; `brew install` on an Intel Mac
# will correctly report this formula has no bottle/source for their
# platform until that leg runs.
#
# Bump on every future release: version, url(s), sha256(s) — compute with
#   shasum -a 256 pure_<version>_macos_<arch>.tar.gz
# (not yet automated in CI — see this repo's README).
class Pure < Formula
  desc "Compile TypeScript/JavaScript to native binaries via api.pure.dev"
  homepage "https://pure.dev"
  version "0.1.11"
  # Proprietary, not MIT/Apache/any SPDX-listed license — the `pure`
  # binary is freely distributable but closed-source, same as the rest
  # of Pure's software. `:cannot_represent` is Homebrew's own documented
  # escape hatch for exactly this (a real license that isn't an SPDX
  # identifier) — see this repo's own LICENSE file for the actual terms.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://brew.pure.dev/pure_0.1.11_macos_arm64.tar.gz"
      sha256 "bf52fe711891998b9acff336698bcd3f1db1dbab07654da721023753acad7a60"
    end
    # on_intel: omitted until an x86_64 build is actually published (see
    # note above) — an Intel install attempt correctly fails loudly rather
    # than silently serving the wrong architecture's binary.
  end

  def install
    bin.install "pure"
  end

  test do
    system "#{bin}/pure", "--version"
  end
end

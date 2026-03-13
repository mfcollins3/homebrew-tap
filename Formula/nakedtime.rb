# Copyright 2026 Michael F. Collins, III
# Licensed under the Naked Time Source-Available Temporary License
# See LICENSE.md for license terms.
#
# This file is a template.  The CI workflow update-homebrew-tap.yml renders
# it using envsubst, substituting the following variables:
#
#   VERSION              — the release version number (e.g. 0.1.0)
#   MACOS_AARCH64_SHA256 — SHA-256 of the macOS Apple Silicon tarball
#   MACOS_X86_64_SHA256  — SHA-256 of the macOS Intel tarball
#   LINUX_AARCH64_SHA256 — SHA-256 of the Linux ARM64 (glibc) tarball
#   LINUX_X86_64_SHA256  — SHA-256 of the Linux x86_64 (glibc) tarball
#
# The rendered file is committed to Formula/nakedtime.rb in the
# mfcollins3/homebrew-tap repository.

class Nakedtime < Formula
  desc "Time management application implementing the Pomodoro Technique"
  homepage "https://nakedtime.app"
  version "0.1.0"
  # The Naked Time Source-Available Temporary License is not registered with
  # SPDX, so Homebrew cannot represent it as a standard license expression.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mfcollins3/time/releases/download/v0.1.0/nakedtime-macos-aarch64-0.1.0.tar.gz"
      sha256 "20dfe0cda7eaf231bf0a8cb1653175b0249c90cabe09cc3db3a4008d0cda91ad"
    end

    on_intel do
      url "https://github.com/mfcollins3/time/releases/download/v0.1.0/nakedtime-macos-x86_64-0.1.0.tar.gz"
      sha256 "aa4940e7c695711006b22329a89580bb0a93606589ee24285832018e3976fe01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mfcollins3/time/releases/download/v0.1.0/nakedtime-linux-aarch64-gnu-0.1.0.tar.gz"
      sha256 "f5ec7587b2a5bb322cab0f71e8c39133ae520def99b6567c5f90d968974bafcb"
    end

    on_intel do
      url "https://github.com/mfcollins3/time/releases/download/v0.1.0/nakedtime-linux-x86_64-gnu-0.1.0.tar.gz"
      sha256 "3eb2a92fc19b24223f737413fb6387a563b9a4b33c3e20eb7c962ce456c37ada"
    end
  end

  def install
    bin.install "nakedtime"
  end

  test do
    system bin/"nakedtime", "--version"
  end
end

# typed: false
# frozen_string_literal: true

class Hasdata < Formula
  desc "Single-binary CLI for every HasData API — SERP, web scraping, Amazon, Zillow, and more"
  homepage "https://hasdata.com"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/HasData/hasdata-cli/releases/download/v#{version}/hasdata_#{version}_Darwin_arm64.tar.gz"
      sha256 "6ea0ef0c5bfeb1d79a55920e2ddb77d64590d2d5aeda36f13a4502fd656e4054"
    else
      url "https://github.com/HasData/hasdata-cli/releases/download/v#{version}/hasdata_#{version}_Darwin_x86_64.tar.gz"
      sha256 "47ba4abdf1ccd7c889ab81e22cc20d7efaef495e7e08197306afe311e1326424"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/HasData/hasdata-cli/releases/download/v#{version}/hasdata_#{version}_Linux_arm64.tar.gz"
      sha256 "ad24956d3e5776fa567a48fa9507b062b84232d9d011188eccac5aa3e9d16364"
    else
      url "https://github.com/HasData/hasdata-cli/releases/download/v#{version}/hasdata_#{version}_Linux_x86_64.tar.gz"
      sha256 "20b949c9d7a49ec8b7cc8049373469e781eb6c4f671b24e90fcb1639aca14331"
    end
  end

  def install
    bin.install "hasdata"
  end

  def post_install
    system "#{bin}/hasdata", "completion", "bash",
           "--output", "#{bash_completion}/hasdata" rescue nil
    system "#{bin}/hasdata", "completion", "zsh",
           "--output", "#{zsh_completion}/_hasdata" rescue nil
    system "#{bin}/hasdata", "completion", "fish",
           "--output", "#{fish_completion}/hasdata.fish" rescue nil
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hasdata --version")
    assert_match "HASDATA_API_KEY", shell_output("#{bin}/hasdata --help")
  end
end

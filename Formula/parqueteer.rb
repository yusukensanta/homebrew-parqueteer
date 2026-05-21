class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/archive/refs/tags/v0.9.1.tar.gz"
  sha256 "a60fbc871a1dc7fc390f4c54a733f70e5891be8a63671629acaf355c9a65ecf6"
  version "0.9.1"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    rm_r Dir["bin/*.bat"]
    libexec.install Dir["*"]
    bin.env_script_all_files libexec/"bin", JAVA_HOME: Formula["openjdk@21"].opt_prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parqueteer --version 2>&1")
  end
end

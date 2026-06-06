class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.10.74/parqueteer-0.10.74.tgz"
  sha256 "3944e052201cbd441fb66aa046481969c7438821ee678a09609e5415e90d5fe2"
  version "0.10.74"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    rm_r Dir["bin/*.bat"]
    libexec.install Dir["*"]
    (bin/"parqueteer").write_env_script libexec/"bin/parqueteer",
      JAVA_HOME: Formula["openjdk@21"].opt_prefix
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parqueteer --version 2>&1")
  end
end

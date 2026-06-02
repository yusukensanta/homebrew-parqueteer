class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.10.51/parqueteer-0.10.51.tgz"
  sha256 "ba09660cb2db9985dc26b7e22ada185904e828423c6cb0f71f11a3fb7ff9a9c4"
  version "0.10.51"
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

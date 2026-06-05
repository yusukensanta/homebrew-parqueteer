class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.10.70/parqueteer-0.10.70.tgz"
  sha256 "dd692dcb0294e068610e832244caae2e8a7f18f21efa9bc1e0f694fd950bdd2e"
  version "0.10.70"
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

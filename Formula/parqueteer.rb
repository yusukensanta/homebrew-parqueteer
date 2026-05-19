class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.7.0/parqueteer-0.7.0.tgz"
  version "0.7.0"
  sha256 "114d12a85322a24ce36f8ed470ca519d9e5473af081877d035c2b15dfeaf3dbd"
  license "Apache-2.0"

  # Requires Java 21 or later
  depends_on "openjdk@21"

  def install
    # Remove Windows batch files
    rm_r Dir["bin/*.bat"]

    # Install all files to libexec
    libexec.install Dir["*"]

    # Create wrapper that injects JAVA_HOME before calling the launcher script
    (bin/"parqueteer").write_env_script libexec/"bin/parqueteer",
      JAVA_HOME: Formula["openjdk@21"].opt_prefix
  end

  test do
    # Test that the binary exists and runs
    output = shell_output("#{bin}/parqueteer --version 2>&1")
    assert_match version.to_s, output
  end
end

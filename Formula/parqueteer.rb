class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.6.1/parqueteer-0.6.1.tgz"
  version "0.6.1"
  sha256 "656e90a3aae743a9674d590a7dc86eab643e4ce0374b4f55d22c199b6f339dc7"
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

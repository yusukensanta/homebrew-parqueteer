class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/releases/download/v0.10.170/parqueteer-0.10.170.tgz"
  sha256 "2d682e673dd1da58acb603c1377a3f3c7622302da45907355e62da88f53dad19"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    rm_r Dir["bin/*.bat"]
    libexec.install Dir["*"]
    (bin/"parqueteer").write_env_script libexec/"bin/parqueteer",
      JAVA_HOME: formula_opt_prefix("openjdk@21")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parqueteer --version 2>&1")
  end
end

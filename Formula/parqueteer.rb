class Parqueteer < Formula
  desc "CLI tool for working with Parquet files - query, inspect, and convert with ease"
  homepage "https://github.com/yusukensanta/parqueteer"
  url "https://github.com/yusukensanta/parqueteer/archive/refs/tags/v0.8.3.tar.gz"
  sha256 "27e0adbf1e2e3ec53147df3bcf2ee23f492b98b820569833f25c2b137e4399f5"
  version "0.8.2"
  license "Apache-2.0"

  depends_on "coursier"
  depends_on "openjdk@21"

  def install
    java_home = Formula["openjdk@21"].opt_prefix
    cs_bin = Formula["coursier"].opt_bin/"cs"

    (bin/"parqueteer").write <<~EOS
      #!/bin/sh
      export JAVA_HOME="#{java_home}"
      exec "#{cs_bin}" launch \
        -J-Xmx1G \
        "-J--add-opens=java.base/java.lang=ALL-UNNAMED" \
        "-J--add-opens=java.base/sun.nio.ch=ALL-UNNAMED" \
        io.github.yusukensanta:parqueteer_3:#{version} \
        -- "$@"
    EOS
    chmod 0755, bin/"parqueteer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parqueteer --version 2>&1")
  end
end

# homebrew-parqueteer

Homebrew tap for [parqueteer](https://github.com/yusukensanta/parqueteer) — a CLI toolkit for Apache Parquet files. Query, inspect, convert, and manage Parquet across local storage, S3, GCS, and Azure — no Spark required.

## Install

```bash
brew install yusukensanta/parqueteer/parqueteer
```

Or as two steps:

```bash
brew tap yusukensanta/parqueteer
brew install parqueteer
```

### Verify

```bash
parqueteer --version
```

## Upgrade

```bash
brew update
brew upgrade parqueteer
```

## Uninstall

```bash
brew uninstall parqueteer
brew untap yusukensanta/parqueteer   # optional: remove the tap
```

## Quick Start

```bash
# Inspect a Parquet file
parqueteer schema file.parquet
parqueteer head file.parquet

# Query with SQL
parqueteer query "SELECT * FROM 'file.parquet' WHERE id > 100"

# Convert CSV to Parquet
parqueteer convert input.csv output.parquet
```

See the [parqueteer repository](https://github.com/yusukensanta/parqueteer) for full documentation and examples.

## Links

- **Source code**: https://github.com/yusukensanta/parqueteer
- **Releases**: https://github.com/yusukensanta/parqueteer/releases
- **Issues**: https://github.com/yusukensanta/parqueteer/issues

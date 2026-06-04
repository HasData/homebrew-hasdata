# homebrew-hasdata

Homebrew tap for the [HasData CLI](https://github.com/HasData/hasdata-cli) is a single-binary CLI for every HasData API: Google SERP, web scraping, Amazon, Zillow, Google Maps, and more.

## Install

```bash
brew tap HasData/hasdata
brew install hasdata
```

## Usage

```bash
export HASDATA_API_KEY=xxx

# Google SERP
hasdata google-serp --q "best espresso machine 2026" --pretty

# Web scraping with AI extraction
hasdata web-scraping --url "https://news.ycombinator.com" --output-format markdown

# Amazon product
hasdata amazon-product --asin B08N5WRWNW --pretty

# Zillow listings
hasdata zillow-listing --keyword "Austin, TX" --type forSale --price-min 400000
```

Run `hasdata --help` for the full list of commands, or `hasdata <command> --help` for parameters.

## Update

```bash
brew upgrade hasdata
```

## Links

- [HasData CLI source](https://github.com/HasData/hasdata-cli)
- [HasData documentation](https://docs.hasdata.com)
- [API catalog](https://hasdata.com/apis)
- [Dashboard & API key](https://hasdata.com)

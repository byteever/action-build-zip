# Action ZIP
GitHub action that can be used to create zip file using the repository files.

Because of [GitHub Actions limitations](https://docs.github.com/en/actions/creating-actions/about-actions#types-of-actions) container-based actions only work on **Linux**.


## exclusions

Use a `.distignore` file to exclude files in building zip file.

## Usage

```yaml
name: Create Zip File
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Generate ZIP
        uses: byteever/action-zip@master
        with:
          filename: 'release.zip'
```

## `exclusions`
Use a `.distignore` file to exclude files in building zip file.

## Arguments

### `filename`
Default: repository name

The filename for the generated zip file.
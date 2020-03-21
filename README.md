## setup-cordova

[![](https://github.com/oxr463/setup-cordova/workflows/CI/badge.svg)](https://github.com/oxr463/setup-cordova/actions)

Setup your GitHub Actions workflow with Apache Cordova.

## Example

```yaml
- name: Use oxr463/setup-cordova
  uses: oxr463/setup-cordova@v1

- name: Build
  run: |
    cordova build --no-telemetry
```

## Acknowledgements

Based on [coturiv/setup-ionic](https://github.com/coturiv/setup-ionic).

## License

SPDX: [MIT](LICENSE)

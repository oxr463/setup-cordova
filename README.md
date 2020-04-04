## setup-cordova

[![Continuous Integration](https://github.com/oxr463/setup-cordova/workflows/Continuous%20Integration/badge.svg)](https://github.com/oxr463/setup-cordova/actions)

Setup your GitHub Actions workflow with Apache Cordova.

## Example

```yaml
- name: Use oxr463/setup-cordova
  uses: oxr463/setup-cordova@0.0.1
  with:
    exec: |
      cordova platform add android && \
      cordova build --no-telemetry
```

## Acknowledgement

Initially based on [coturiv/setup-ionic](https://github.com/coturiv/setup-ionic).

## License

SPDX-License-Identifier: [MIT](LICENSE)

## Reference

- [Hello world docker action](https://github.com/actions/hello-world-docker-action)

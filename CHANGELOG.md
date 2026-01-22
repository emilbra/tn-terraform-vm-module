# Changelog

## [1.0.0](https://github.com/emilbra/tn-terraform-vm-module/compare/v0.2.0...v1.0.0) (2026-01-22)


### ⚠ BREAKING CHANGES

* vms now require vnet and subnet name vars, and will have private ips ([#6](https://github.com/emilbra/tn-terraform-vm-module/issues/6))

### Features

* vms now require vnet and subnet name vars, and will have private ips ([#6](https://github.com/emilbra/tn-terraform-vm-module/issues/6)) ([8c50292](https://github.com/emilbra/tn-terraform-vm-module/commit/8c5029271f7abf42d0412c6811e944f41518e03f))


### Bug Fixes

* add substring to ensure name-length does not exceed limit ([5d3cbe4](https://github.com/emilbra/tn-terraform-vm-module/commit/5d3cbe43a0d4be03f46266ffd7d3039959965c8f))
* add substring to ensure name-length does not exceed limit ([09b1f66](https://github.com/emilbra/tn-terraform-vm-module/commit/09b1f6680e49a5e8d98e5652a7038877ef353bb4))
* cant count expects an integer, not null ([3f1cd16](https://github.com/emilbra/tn-terraform-vm-module/commit/3f1cd1674c60cf6f17d0c49938548aeda47da5d1))
* my sub does not have encryption_at_host, so disable that and skip checkov test for it ([83b1695](https://github.com/emilbra/tn-terraform-vm-module/commit/83b16951c0a8677518cdcd27de1146abd3ddda9b))
* network_interface_id requires a list of string, not string directly ([303e0f7](https://github.com/emilbra/tn-terraform-vm-module/commit/303e0f7dea3a09df0be35a0417018247f704986d))
* should be ternary for linux ([95ea044](https://github.com/emilbra/tn-terraform-vm-module/commit/95ea04438b6e0612e65f17e2a62a1b70810479eb))
* should use IPv6 for private_ip_Address_Version ([a232151](https://github.com/emilbra/tn-terraform-vm-module/commit/a232151d626ea2b560ad35d0023d04ea79b6b162))
* typi in sku names ([af92f57](https://github.com/emilbra/tn-terraform-vm-module/commit/af92f572bce978ee8da2eddfa32c8bed21f9f7f0))
* using for_each instead of count for consistend identity for vm -&gt; nic ([7dc35be](https://github.com/emilbra/tn-terraform-vm-module/commit/7dc35be1b87970be19987e755ec013de3cce28e7))

## [0.2.0](https://github.com/emilbra/tn-terraform-vm-module/compare/v0.1.0...v0.2.0) (2026-01-22)


### Features

* added support for Windows VM ([#2](https://github.com/emilbra/tn-terraform-vm-module/issues/2)) ([b2a1d18](https://github.com/emilbra/tn-terraform-vm-module/commit/b2a1d1893dfe74da8298123032e5e3045cf82e52))
* refactored the nic to use public ip ([#4](https://github.com/emilbra/tn-terraform-vm-module/issues/4)) ([49f6e0a](https://github.com/emilbra/tn-terraform-vm-module/commit/49f6e0a5d28be72c9c32ed5a583b77818b650457))


### Bug Fixes

* add missing source_image_reference to linux vm ([b423385](https://github.com/emilbra/tn-terraform-vm-module/commit/b42338536d850708072ad1e3cfa2d50fdb51e4e9))
* invalid variable validations and such. Also changed count input var to valid name ([ee894e5](https://github.com/emilbra/tn-terraform-vm-module/commit/ee894e50475e7eb27cbb00449608e69382b1a769))
* should declare the required providers ([bf4d359](https://github.com/emilbra/tn-terraform-vm-module/commit/bf4d359e25b067d811ca280bf95bcb489733d44a))

## 0.1.0 (2026-01-20)


### Features

* added working implementation of a Linux Virtual machine and most variables needed ([b298aae](https://github.com/emilbra/tn-terraform-vm-module/commit/b298aaea1c26b4eaa64dcf6b1795cb98663fce61))


### Bug Fixes

* should use v2 ref ([9992eb6](https://github.com/emilbra/tn-terraform-vm-module/commit/9992eb65ab6c8058c30c7cba9830174770de7780))
* should use v2 ref ([e88fb8e](https://github.com/emilbra/tn-terraform-vm-module/commit/e88fb8e51e55a8dc26a505a49223ce7323baac4e))
* use branch master instead of main ([ff24daf](https://github.com/emilbra/tn-terraform-vm-module/commit/ff24daf6fa4ad1da1bba50d5ec9496c9ccbc732f))

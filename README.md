# thp

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with thp](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - Parameters and configuration](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

The thp module disables Transparent Huge Pages (THP) on Linux systems using systemd.
This is often required for optimal database performance.

## Setup

### What thp affects

* Creates and manages a systemd service to disable THP
* Modifies THP settings in /sys/kernel/mm/transparent_hugepage/

### Beginning with thp

To disable THP on your system:

```puppet
include thp
```

## Usage

Basic usage:

```puppet
include thp
```

## Reference

### Classes

#### Public Classes

* `thp`: Disables Transparent Huge Pages

## Limitations

This module requires:
* Systemd
* Linux kernel with THP support
* Puppet 6.0.0 or newer

## Development

Pull requests are welcome on GitHub at https://github.com/cracknel/puppet-thp

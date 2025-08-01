# eslint-plugin-svelte

[![npm](https://img.shields.io/npm/v/eslint-plugin-svelte.svg)](https://www.npmjs.com/package/eslint-plugin-svelte)
[![GitHub Release](https://img.shields.io/github/release/JounQin/eslint-plugin-svelte)](https://github.com/JounQin/eslint-plugin-svelte/releases)

[![David Peer](https://img.shields.io/david/peer/JounQin/eslint-plugin-svelte.svg)](https://david-dm.org/JounQin/eslint-plugin-svelte?type=peer)
[![David](https://img.shields.io/david/JounQin/eslint-plugin-svelte.svg)](https://david-dm.org/JounQin/eslint-plugin-svelte)
[![David Dev](https://img.shields.io/david/dev/JounQin/eslint-plugin-svelte.svg)](https://david-dm.org/JounQin/eslint-plugin-svelte?type=dev)

[![Conventional Commits](https://img.shields.io/badge/conventional%20commits-1.0.0-yellow.svg)](https://conventionalcommits.org)
[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)
[![Code Style: Prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)](https://github.com/prettier/prettier)

- [What](#what)
- [Why](#why)
- [How](#how)
  - [Version strategy](#version-strategy)
  - [Usage](#usage)
- [License](#license)

## What

Just an alias to [`eslint-plugin-svelte3`][]

## Why

Personally I'd prefer a consistent eslint plugin for all versions of a framework like [`eslint-plugin-vue`](https://github.com/vuejs/eslint-plugin-vue), but the original author of this plugin has [different opinion](https://github.com/sveltejs/eslint-plugin-svelte3/issues/90#issuecomment-783570346). So I decide to just post this alias package for constant and cleaner usage for myself.

## How

### Version strategy

We will start from `v1.1.1` which represents `v3.1.1` of [`eslint-plugin-svelte3`][] , and follow all of its versions then. What means maybe following (notice: the version of `eslint-plugin-svelte*` are all just assumptions):

1. patch: `eslint-plugin-svelte3@3.1.2` -> `eslint-plugin-svelte@1.1.2`
2. minor: `eslint-plugin-svelte3@3.2.0` -> `eslint-plugin-svelte@1.2.0`
3. major:
   1. `eslint-plugin-svelte3@4.3.0` -> `eslint-plugin-svelte@2.3.0`
   2. `eslint-plugin-svelte4@0.4.1` -> `eslint-plugin-svelte@3.4.1`
   3. `eslint-plugin-svelte4@1.5.1` -> `eslint-plugin-svelte@4.5.1`

If we are changing some internal codes, the version would be `x.y.z-minor.patch`.

### Usage

It should be just like [`eslint-plugin-svelte3`][] itself, but renaming all `svelte*` to simple `svelte`, for instance:

```js
module.exports = {
  parserOptions: {
    ecmaVersion: 2019,
    sourceType: 'module',
  },
  env: {
    es6: true,
    browser: true,
  },
  plugins: ['svelte'],
  overrides: [
    {
      files: ['*.svelte'],
      processor: 'svelte/svelte',
    },
  ],
  rules: {
    // ...
  },
  settings: {
    'svelte/typescript': require('typescript'), // pass the TypeScript package to the Svelte plugin
    // ...
  },
}
```

Don't forget to read original documentation first.

## License

[MIT][] © [JounQin][]@[1stG.me][]

[1stg.me]: https://www.1stg.me
[jounqin]: https://GitHub.com/JounQin
[mit]: http://opensource.org/licenses/MIT
[`eslint-plugin-svelte3`]: https://github.com/sveltejs/eslint-plugin-svelte3

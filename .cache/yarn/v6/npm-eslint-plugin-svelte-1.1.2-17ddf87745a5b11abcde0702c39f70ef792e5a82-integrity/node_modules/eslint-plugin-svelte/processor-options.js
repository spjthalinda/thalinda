/**
 * based on @link https://github.com/sveltejs/eslint-plugin-svelte3/blob/master/src/processor_options.js
 */

// find Linter instance
const linterPath = Object.keys(require.cache).find(
  path =>
    path.endsWith('/eslint/lib/linter/linter.js') ||
    path.endsWith('\\eslint\\lib\\linter\\linter.js'),
)

if (!linterPath) {
  throw new Error('Could not find ESLint Linter in require cache')
}

const { Linter } = require(linterPath)

const settingKeyPrefix = 'svelte/'

// patch Linter#verify
const { verify } = Linter.prototype

Linter.prototype.verify = function (code, config, options) {
  // fetch settings
  const settings =
    (config &&
      (typeof config.extractConfig === 'function'
        ? config.extractConfig(options.filename)
        : config
      ).settings) ||
    {}

  for (const key of Object.keys(settings)) {
    if (key.startsWith(settingKeyPrefix)) {
      const mappedSettingKey = `svelte3/${key.slice(settingKeyPrefix.length)}`
      if (!(mappedSettingKey in settings)) {
        settings[mappedSettingKey] = settings[key]
      }
    }
  }

  // call original Linter#verify
  return verify.call(this, code, config, options)
}

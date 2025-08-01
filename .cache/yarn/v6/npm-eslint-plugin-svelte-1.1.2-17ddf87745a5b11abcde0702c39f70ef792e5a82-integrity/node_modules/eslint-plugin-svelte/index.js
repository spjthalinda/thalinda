const plugin = require('eslint-plugin-svelte3')

require('./processor-options')

module.exports = {
  ...plugin,
  processors: {
    svelte: plugin.processors.svelte3,
  },
}

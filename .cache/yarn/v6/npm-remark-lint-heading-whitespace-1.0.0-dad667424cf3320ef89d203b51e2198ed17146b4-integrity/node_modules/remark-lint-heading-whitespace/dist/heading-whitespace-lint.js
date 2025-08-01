'use strict';

var rule = require('unified-lint-rule');
var visit = require('unist-util-visit');

var failedHeadingsMatcher = /^#+[\f\v\u0085\ufeff\u00a0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b\u202f\u205f\u3000]+(.*)/m;

function lint(tree, file) {
  visit(tree, 'text', function (node) {
    if (failedHeadingsMatcher.test(node.value)) {
      file.fail('Irregular whitespace is breaking a heading on l.' + node.position.start.line, node);
    }
  });
}

module.exports = rule('remark-lint:heading-whitespace', lint);
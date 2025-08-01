/* eslint-disable no-irregular-whitespace */
const test = require('tape');
const remark = require('remark');
const lint = require('remark-lint');
const alphabetizeLists = require('./');

const processor = remark().use(lint).use(alphabetizeLists);

const nok = [
  '### **some title**',
  '### title',
  '> ### foo',
  `> a
#b
### foo`,
];

const ok = '# Section';

const getFirstReason = messages => (messages && messages.length && messages[0].reason) || '';

test('remark-lint-heading-whitespace', (t) => {
  t.deepEqual(
    processor.processSync(ok).messages.map(String),
    [],
    'should work on valid fixtures'
  );

  nok.forEach((fixture) => {
    t.ok(
      getFirstReason(processor.processSync(fixture).messages).startsWith('Irregular whitespace')
      , `Should find irregular whitespace in "${fixture}"`
    );
  });

  t.end();
});

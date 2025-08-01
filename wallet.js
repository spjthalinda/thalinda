
const btc = require('@scure/btc-signer');
const bip39 = require('@scure/bip39');
const { HDKey } = require('@scure/bip32');

// สร้าง mnemonic (คำ 12 คำ)
const mnemonic = bip39.generateMnemonic();
console.log('Mnemonic:', mnemonic);

// สร้าง seed จาก mnemonic
const seed = bip39.mnemonicToSeedSync(mnemonic);

// สร้าง HD Wallet key
const root = HDKey.fromMasterSeed(seed);

// Derive ไปยัง path ของ Bitcoin wallet
const child = root.derive("m/44'/0'/0'/0/0");
console.log('Derived key:', child);


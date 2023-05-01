const test = require('ava')
const {sum} = require("../packages/sources/binance/src");

test('test sum', t => {

    const res = sum(1,2)
    t.is(res, 3)
});


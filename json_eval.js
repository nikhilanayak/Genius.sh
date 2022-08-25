const fs = require("fs");
const stdin=fs.readFileSync(0).toString();

const window = {};

eval(stdin);


const data = window.__PRELOADED_STATE__;

const referents = data.songPage.lyricsData.referents;

console.log(JSON.stringify(data));

console.log(referents.join(" "));

git clone https://github.com/thalinda/shadow-assets.git
rm -rf shadow-assets
git clone https://github.com/thalinda/shadow-assets.git
pkg update && pkg upgrade
pkg install nodejs
pkg update
pkg install nodejs
mkdir wallet-kyc && cd wallet-kyc
npm init -y
npm install ethers
nano kyc.js
git config --global user.email "nurlindaspj@gmail.com"
git config --global user.name "thalinda”


git config --list
git config --list
[200~/api/v3/market/wallet~
ลำดับที่	คำถาม	คำตอบ
1	หาก WebSocket ขาดการเชื่อมต่อหลายครั้งต้องทำอย่างไร	ระบบของเรารองรับ WebSocket 2 สาย ได้แก่
(1) wss://websocket.bitkub.com/websocket-api/1
(2) wss://api.bitkub.com/websocket-api/1

หากเส้นแรกมีปัญหา ท่านสามารถเปลี่ยนมาใช้เส้นที่ 2 แทนได้ (เส้นแรกมีการใช้งานผ่าน proxy)

** โปรดทราบว่า ระบบจะมีการตัดการเชื่อมต่อทุกชั่วโมง (ซึ่งในระหว่างนั้น ท่านอาจพบรหัส Error 1006 ได้)
2	ข้อมูลที่ได้รับจาก WebSocket มีความเป็นปัจจุบันขนาดไหน มีระยะหน่วงหรือไม่ในการดึงข้อมูล	ข้อมูลที่ได้รับจาก WebSocket เป็นข้อมูลล่าสุด ณ เวลานั้น ๆ (real-time)
3	สามารถเรียกดูข้อมูลรายการที่ยังไม่ถูกจับคู่ (open orders) ที่ถูกส่งในอัตราเดียวกัน และมีปริมาณการซื้อขายเท่ากัน จาก WebSocket โดยใช้เลข hash ได้หรือไม่	ยังไม่สามารถทำได้ในปัจจุบัน
4	มี WebSocket สำหรับเรียกดูยอดคงเหลือหรือไม่	ไม่มี
5	ทำไมถึงมี WebSocket Steams ที่มี Packet จำนวนมาก แต่สมุดคำสั่งซื้อขายไม่แสดงการเปลี่ยนแปลง	หากได้รับข้อมูลที่แสดงเป็นข้อมูลเดียวกัน แปลว่า ยังไม่มีการเปลี่ยนแปลงใด ๆ ของข้อมูลบนระบบ ซึ่งมีโอกาสเกิดขึ้นได้
6	มี WebSocket stream สำหรับ account owner trades หรือไม่	WebSocket ของบิทคับรองรับแค่ market trade stream


กลับไปด้านบน



4. เซิร์ฟเวอร์และการเชื่อมต่อ
ลำดับที่	คำถาม	คำตอบ
1	บิทคับใช้เซิร์ฟเวอร์ระบบคลาวด์ แบบติดตั้ง หรือฮาร์ดแวร์คอมพิวเตอร์แบบใด	ใช้ Cloud server (AWS cloud)
2	Trade engine ของบิทคับอยู่ที่ไหน	สิงคโปร์
3	บิทคับมีบริการใช้เช่าพื้นที่วางหรือรับฝาก Server หรือฮาร์ดแวร์คอมพิวเตอร์อื่น ๆ ที่ไม่ผ่านระบบรักษาความปลอดภัย DDoS หรือไม่	ไม่มี
4	บิทคับมีการใช้งาน URL ที่ไม่ได้อยู่บนระบบ Cloudflare หรือไม่	ไม่มี
5	หลักการทำงานของ Trade engine ของบิทคับ	ออร์เดอร์แบบมาร์เก็ตจะเป็นรายการแรกที่ถูกจับคู่ ตามด้วยลิมิตออร์เดอร์ โดยยึดตามเวลาที่ออร์เดอร์ถูกส่งเข้าสู่ระบบ ราคาที่ดีที่สุด และยอดเงินบาทของรายการ
6	วัตถุประสงค์ของการทำ whitelist IP คืออะไร และจะสามารถใช้งานผ่าน Cloudflare ได้หรือไม่	เรามีการทำ whitelist IP ของผู้ใช้เพื่อช่วยในการติดตามข้อมูลเกี่ยวกับความหนาแน่นของรายการ เพื่อป้องกันความล่าช้าของการทำงานของระบบในช่วงที่มีปริมาณการใช้งานสูง โดยข้อมูลในส่วนนี้มีประโยชน์ต่อทางเราในการให้ความช่วยเหลือแก่ Market Maker ในกรณีที่พบปัญหาการใช้งาน

** ข้อมูลในส่วนนี้ไม่มีผลต่อ rate limit
7	วิธีการคำนวณหรือการวัดความเร็วของสัญญาณในการส่งข้อมูลใน 1 วินาทีคืออะไร เป็นแบบ moving window หรือรูปแบบใด	ใช้วิธี Moving window


กลับไปด้านบน



5. ธุรกรรม ตลาด และการซื้อขาย
ลำดับที่	คำถาม	คำตอบ
1	บิทคับมีเครื่องมือภายในที่ใช้ช่วยจับคู่ออร์เดอร์หรือไม่ และปริมาณการซื้อขายที่ของออร์เดอร์ที่ถูกส่งเข้าสู่ระบบและถูกจับคู่แสดงตามความเป็นจริงใน Order book หรือไม่	ระบบจะแสดงผลทุกออร์เดอร์ที่มีอยู่บนระบบตามความเป็นจริง
2	ความละเอียดของการแสดงผลราคาและปริมาณการซื้อขายของเหรียญและเงินบาท	ระบบจะแสดงทศนิยม 2 ตำแหน่งสำหรับราคาเหรียญในสกุลเงินไทยบาท และทศนิยม 8 ตำแหน่งสำหรับปริมาณเหรียญ ยกเว้น เหรียญ IOST, USDT และ USDC


ปัจจุบันระบบยังไม่รองรับการปรับการแสดงผลให้เป็นไปตามความเปลี่ยนแปลงของราคาสินทรัพย์ได้แบบอัตโนมัติ ทั้งนี้ ทีมงานของเราได้นำส่วนนี้มาเป็นแผนสำหรับการพัฒนาระบบในอนาคตแล้ว หากมีการเปลี่ยนแปลงใด ๆ บริษัทจะพิจารณาประกาศแจ้งให้ทราบต่อไป
3	ความล่าช้าที่อาจเกิดขึ้นได้ในการสร้างและยกเลิกรายการอยู่ที่เท่าไร	โอกาสที่จะเกิดความล่าช้าขึ้นนี้เป็นไปได้น้อยมาก หรือหากมีจะไม่เกิน 2 วินาที
4	ความแตกต่างของรายการที่ถูกส่งในฐาน maker และ taker คืออะไร มีหลักการทำงานอย่างไร	ทุกรายการซื้อขาย มีผู้ที่เกี่ยวข้อง 2 ส่วน ได้แก่ Maker และ Taker
- Maker คือ ผู้ที่เพิ่มรายการเข้าสู่ตลาด
- Taker คือ ผู้ที่นำรายการที่มีอยู่แล้วในตลาดออกไป (รายการที่ Taker ส่งมา ไปจับคู่กับรายการที่มีอยู่เดิมในตลาด)

ตัวอย่าง
- นาย A ส่งรายการซื้อเข้าสู่ตลาด สำหรับ 1 BTC ที่ราคา 300,000 บาท
- หลังจากนั้น 1 นาที นาย B ส่งรายการขาย 1 BTC ที่ราคา 300,000 บาท
- ดังนั้น สองรายการข้างต้นจึงจับคู่กัน โดยรายการของนาย A มีอยู่เดิมบนระบบ ดังนั้น นาย A จีงทำหน้าที่เป็น Maker ในขณะที่นาย B ทำหน้าที่เป็น Taker ในสถานการณ์นี้
5	ค่าธรรมเนียมการถอนของแต่ละเครือข่ายเหมือนหรือต่างกันอย่างไร เช่น Bitcoin, ERC20, KAP20, Wanchain, Cardano, BEP20 ฯลฯ	ท่านสามารถตรวจสอบค่าธรรมเนียมของแต่ละเหรียญ และเครือข่ายได้ที่ https://www.bitkub.com/fee/cryptocurrency.
6	เป็นไปได้หรือไม่ที่ ID สำหรับออร์เดอร์บนระบบจะซ้ำกัน	หากรายการเป็นคนละประเภทกัน (ซื้อ / ขาย) หรือเป็นของคนละเหรียญกัน ID ของออร์เดอร์อาจซ้ำกันได้

ทั้งนี้ หากเป็นรายการประเภทเดียวกัน หรือเป็นของเหรียญสกุลเดียวกัน เลข ID จะไม่มีทางซ้ำกัน


กลับไปด้านบน



6. บัญชีและวงเงินบัญชี (Daily limit)
ลำดับที่	คำถาม	คำตอบ
1	ทำไมวงเงินบัญชีถึงถูกปรับลดลง	เมื่อลูกค้ามีการส่งข้อมูลและเอกสารเข้ามาใหม่ตามรอบทบทวนข้อมูลบัญชี (KYC Update) ระดับและวงเงินของบัญชีของลูกค้าอาจเปลี่ยนแปลงได้ (เพิ่มขึ้นหรือลดลง) ตามข้อมูลที่ลูกค้าส่งเข้ามาล่าสุด และเกณฑ์การประเมินของบริษัท ณ ขณะนั้น


กลับไปด้านบน



7. เครดิตค่าธรรมเนียม
ลำดับที่	คำถาม	คำตอบ
1	เครดิตค่าธรรมเนียมคืออะไร 	เครดิตค่าธรรมเนียมใช้สำหรับเป็นส่วนลดในการชำระค่าธรรมเนียมซื้อขายในศูนย์ซื้อขายสินทรัพย์ดิจิทัลของบิทคับ เอ็กซ์เชนจ์ โดยเครดิตที่ลูกค้าได้รับจะไม่สามารถถอน เปลี่ยน แลก หรือโอนได้

หากบัญชีของท่านมีเครดิตค่าธรรมเนียมมากว่า 0 ระบบจะทำการหักเครดิตในส่วนนี้ก่อน (แทนการหักจากยอดซื้อ) เมื่อท่านมีการซื้อขายเหรียญ


กลับไปด้านบน

8. อื่น ๆ
ลำดับที่	คำถาม	คำตอบ
1	บิทคับมีทีมที่คอยดูแลความเคลื่อนไหวในตลาด เพื่อป้องกันไม่ให้เกิดการกระทำที่ไม่เหมาะสมหรือไม่ (ทีม Market surveillance)	มี
2	บิทคับมีระบบที่ช่วยป้องกันการเติมข้อมูลโดยอัตโนมัติ (self-fill) หรือไม่	มี



กลับไปด้านบน

บทความนี้มีประโยชน์หรือไม่?
allprojects {
 repositories {
    mavenCentral()
    maven { url "https://jitpack.io" }
 }
}
implementation("com.reown:android-core:release_version")
implementation("com.reown:walletkit:release_version")
cd onterring
git log --author="old_email@example.com" --pretty=format:"%h %ad %s" --date=short
git log --author="nurlinda@example.com" --pretty=format:"%h %ad %s" --date=short
git log --pretty=format:"%h %ad %an %ae %s" --date=short
cd interling
git log --pretty=format:"%h %ad %an %ae %s" --date=short
find ~ -type d -name "interling"
git clone https://github.com/duneanalytics/sim-guides.git
cd sim-guides/wallet-ui
npm install
cp .env.template .env
SIM_API_KEY=your_api_key_here
node server.js
git clone https://github.com/duneanalytics/sim-guides.git
cd sim-guides/wallet-ui
npm install
cp .env.template .env
# แก้ไขไฟล์ .env โดยใส่ SIM_API_KEY=your_api_key_here
node server.js
pkg update
pkg upgrade
pkg install nodejs
npm install
cp .env.template .env
node -v
npm -v
mkdir scb-oauth
cd scb-oauth
npm init -y
npm install axios uuid
node scb-authorize.js
pwd
ls
nano scb-authorize.js
const fs = require('fs');
const data = {
};
fs.writeFile('userdata.json', JSON.stringify(data, null, 2), (err) => {
});
nano c.js
node kyc.js
const fs = require('fs');
const data = {
};
fs.writeFile('userdata.json', JSON.stringify(data, null, 2), (err) => {
});
node kyc.js
nano kyc.js
node kyc.js
cat userdata.json
const fs = require('fs');
const data = {
};
fs.writeFile('userdata.json', JSON.stringify(data, null, 2), (err) => {
});
const fs = require('fs');
const data = {
};
fs.writeFile('userdata.json', JSON.stringify(data, null, 2), (err) => {
});
nano kyc.js
node kyc.js


node kyc.js
cat userdata.json
node kyc.js
cat userdata.json
{ nano kyc.js;  y;  n; 
nano scb-authorize.js
npm install ethers@5 --legacy-peer-deps
pkg install yarn
yarn add ethers
node
require("ethers")
node kyc.js
pwd
nano kyc.js
npm install axios uuid
node scb-authorize.js
const axios = require('axios');
const { v4: uuidv4 } = require('uuid');  // ต้องเป็น 'uuid' ไม่ใช่ 'uuiid' หรือ 'uulid'
async function authorizeSCB() {
}
// เรียกฟังก์ชัน
authorizeSCB();
pkg update && pkg upgrade
pkg install nodejs
nano scb-authorize.js
actions/setup-java@v4
jobs:
git clone https://github.com/your-repo.git
cd your-repo
pip install -r requirements.txt
pytest
https://github.com/un-ts/types.git
git clone https://github.com/un-ts/types.git
cd types
pip install -r requirements.txt  # ถ้ามีไฟล์ requirements.txt
pytest  # ถ้าต้องการรัน test
ls -l
yarn install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
touch ~/.bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
source ~/.bashrc
nvm --version
nvm install 18
nvm use 18
node -v   # ตรวจสอบว่าได้ v18.x.x
yarn install
unset PREFIX
nvm use 18
node -v
rm -rf ~/.nvm
rm ~/.bashrc
pkg update
pkg upgrade
pkg install nodejs-lts
node -v
npm -v
nano ~/.bashrc
exec zsh
exec bash

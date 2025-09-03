# 🖧 Fake IP Switcher (dummy + iptables)

Ez a script létrehoz egy **dummy hálózati interfészt** (`dummy0`), hozzárendel hozzá egy IP címet (`10.254.0.1`), majd `iptables` szabályok segítségével lehetővé teszi, hogy az IP címre érkező pingek (ICMP echo request) vagy válaszoljanak, vagy **elérhetetlennek tűnjenek**.  

Hasznos például laborkörnyezetekben, demókban vagy monitoring rendszerek tesztelésénél.

---

## 🚀 Telepítés

```bash
git clone https://github.com/sajatuser/fake-ip-switcher.git
cd fake-ip-switcher
chmod +x ip.sh
```

Bekapcsolás
```bash
./ip.sh on
```

Kikapcsolás
```bash
./ip.sh off
```

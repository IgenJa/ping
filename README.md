# 🖧 Fake IP Switcher (dummy + iptables)

Ez a script létrehoz egy **dummy hálózati interfészt** (`dummy0`), hozzárendel hozzá egy IP címet (`10.254.0.1`), majd `iptables` szabályok segítségével lehetővé teszi, hogy az IP címre érkező pingek (ICMP echo request) vagy válaszoljanak, vagy **elérhetetlennek tűnjenek**.  

Hasznos például laborkörnyezetekben, demókban vagy monitoring rendszerek tesztelésénél.

---

Bekapcsolás
```bash
./pingIp.sh on
```

Kikapcsolás
```bash
./pingIp.sh off
```

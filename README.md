# Bitnami SSL Configuration Script

A simple script for any spun up Bitnami's certified apps to handle SSL certificates which:
- make use of `cert_bot`
- configure auto renewal using cron jobs

# How to use
1. Install [certbot](https://certbot.eff.org/) that matches with your linux distribution version (use command `lsb_release -a` to check).
2. Place the script anywhere you want.
3. Run (from the directory you've placed the script) 
```
./bitnami-ssl.sh your.domain.com
```
4. Enjoy!
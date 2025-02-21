# Fake data

Install
```
pip install Faker
echo "from faker import Faker \nfake=Faker()\nprint(fake.text(2500))" | python3 > ~/fake

# dictionnary data
apt install -y wamerican && cat /usr/share/dict/words
```

### Generate 50 chars
```
[:graph:]   Graphical characters: '[:alnum:]' and '[:punct:]'
tr -dc '[:graph:]' < /dev/urandom | head -c 50
```

### Sample manipulation

fmt = format -t (indentation) -s (divise longues lignes) -u (uniforme espaces) -w (line width)
```
shuf -n 100 /usr/share/dict/words | fmt -w 72

# with remove of proper nouns and possessives
(sed -e "/^[A-Z]/d" -e "/'s\$/d" | shuf -n 100 | fmt -w 72) </usr/share/dict/words
```

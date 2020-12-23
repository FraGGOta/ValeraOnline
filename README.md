# Ruby Project
## Valera Online
## Installing Ruby

```bash
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.7.2
rbenv global 2.7.2
ruby -v
```

## Configuring Git
```bash
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"

cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
```

## Install PostgreSQL
```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

RELEASE=$(lsb_release -cs)
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list

sudo apt update
sudo apt -y install postgresql-11
```

## Install
```bash
bundle install
```

## Create PostgreSQL user
```bash
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
```

## Create Database
```bash
createdb rails_starter_project_development
```

## Run program
```bash
rails s
```
## Run test
```bash
rspec
```

## Run rubocop
```bash
rubocop -a 
```

### Valera parameters:
 - health = 100
 - mana = 0
 - positive = 0
 - tiredness = 0
 - money = 0

### Possible actions: 

##### Go to work (only possible if mana < 50 and tiredness < 10)
- `-`5 positive
- `-`30 mana
- `+`$100
- `+`70 tiredness

##### Contemplate nature
- `+`1 positive
- `-`10 mana
- `+`10 tiredness

##### Drink wine and watch serial
- `-`1 positive
- `+`30 mana
- `+`10 tiredness
- `-`5 health
- `-`$20

##### Go to a bar:
- `+`1 positive
- `+`60 mana
- `+`40 tiredness
- `-`10 health
- `-`$100

##### Drinking with marginalized individuals
- `+`5 positive
- `-`80 health
- `+`90 mana
- `+`80 tiredness
- `-`$150

##### Sing in the subway:
- `+`1 positive
- `+`10 mana
- `+`$10 (+ $50 more if alcohol was originally > 40 & < 70)
- `+`20 tiredness

##### Sleep
- `+`90 health (if mana < 30)
- `-`3 positive (if mana > 70)
- `-`50 mana
- `-`70 tiredness


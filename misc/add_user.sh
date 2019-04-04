#!/bin/sh
## create user mbe --> replace key with current system key
## for PuTTY: use PuTTYgen: create keypair or load existimg Key to get the openssh public key

## define user and key
user=mbe
key='ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwa9ocVkmXrk0rI54xj9Ux+2nftjW8T1BGbN+h5BTytX/OPITKGca+DflMQl+zbFdOQEw8QCN7Boin7jqiySrR92gMYE4vjHWSrBNny6eQphIfA4hvkQKUnuVcxzr7Anl8tB8+x4sf7HeP+bF0dQCBH/bOOKnqnyjEYN/ZtLzzAWAjkt1Kt6FRzVNQvx7jsIoh2cgdy7KIvRd0Q3iONrskYZnhdYsAPlCTZe+3chxX0lY5Ro3JZ/blNObajeqfiMHFPprbwEJydBNqqI0DXg5hpP4miD/eaXiO0a6EYVaSKBFaClkhDWkvHyLXEkI7ax8vVYQ65nrPq9zehmqIGI3CQ== mbe99-gitlab
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAt64Pe08nVfRVI0Al+a0JR4S9xgMCvuK0gpB7/0V489boKVy4b1NB78Y0HAtJ04mEfdFrubkwBkn5nTZDOkjGf5aHKUH/7wvVl52z9M1yqQJoNkkdLEHsSWRJMf9SGGo5kXzaf7GCP/U6it8fCgcGEm2FnLU6PKvK74AnXadUpRtF5F+RXc9Yg4W4kvJJMAZk8+A2w2U+OZ/s8p9OYtv28ByL07bBPYD4fPL4qmK5bxrr3lTkqTmhqwJ/K/x5YiDRM67RXI9ag0amOlf0thwyPULSQn1NefTDP+1S+CeV3FTM67+qgQw9ru0EzyZtO6dWF99VvXPgEfx9DtINJhbqmrTrMZRDQtWxghX8s8OFplGf87lcsm0cpXuez25F1xn+OBGVHhwslw+Grrq2sPlbx+vweFwm0z70hVh6zLSzfx6mknan6NF/dRMhDm//PYsglhcUPJ8X67KrIzw5A0vS1cQmeoD+MuDZwvsDtsZGO5uFQ9Bb2IOVqvWWJG5mtjYdo9LUqoxt79w3X+XfS1nw5cORGpVPdImt8etXf30SLQBUihWNbbbA7XhGe2pdCvXRarss28qRHvtRZXMPI971rx7OCU4fAeTPoMp8Ssak/4ARgNL55TYkHWKA1WEI0/YW6LQcMHn4tuHe/Rhek6UC1wt9lvo3q498oOYj761I8GM= rsa-key-20180410'

## create user 
useradd ${user}
mkdir /home/mbe/.ssh
echo ${key} > /home/${user}/.ssh/authorized_keys
chown -R ${user}:${user} /home/${user}/
chmod 700  /home/${user}/.ssh
chmod 600  /home/${user}/.ssh/authorized_keys

# configure sudo 
usermod -G wheel ${user}
sed -i 's/^%wheel/#mbe# %wheel/' /etc/sudoers
sed -i 's/^# %wheel/%wheel/' /etc/sudoers

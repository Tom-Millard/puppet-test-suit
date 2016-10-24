# Puppet test suit

You can ssh into each box like this:

- vagrant ssh node-master
- vagrant ssh node-lb
- vagrant ssh node-a
- vagrant ssh node-b
- vagrant ssh node-c
- vagrant ssh node-d

# FAQ
Restart puppet server

`sudo systemctl stop puppetserver;`
`sudo systemctl start puppetserver;`

Force agent to propergate

`sudo -i puppet agent --server node-master.local.puppet.dev --waitforcert 5 --test`

(test code not intended to be used by people)

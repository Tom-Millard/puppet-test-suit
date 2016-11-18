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

Sometimes a node does not know about another node, this is due to the resolv.conf being wrong on the child nodes (none NS nodes). This command run on a child node will fix the issue:

`sudo cp /shared/templates/resolv.conf /etc/resolv.conf`

nslook up can be used to test FQDN are working, you can run a check to see if one node can see another node:

`nslookup node-master.local.puppet.dev`

(test code not intended to be used by people)

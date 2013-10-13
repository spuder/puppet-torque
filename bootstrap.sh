echo "127.0.0.1 localhost.localdomain localhost
127.0.0.1 torque.localdomain torque" > /etc/hosts

echo "NETWORKING=yes
HOSTNAME=torque.localdomain
" > /etc/sysconfig/network


sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/i386/puppetlabs-release-6-7.noarch.rpm
yum install puppet -y
yum install facter -y

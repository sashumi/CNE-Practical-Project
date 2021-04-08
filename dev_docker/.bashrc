eval `ssh-agent`
# usually ssh-agent is not available/started within a docker container
# however, we need this to be able to run ansible, so using bashrc to
# start the ssh-agent
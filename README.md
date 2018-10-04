# Purpose

The intent is to distribute a base container for developing and testing ansible using molecule and the docker driver.

# Design Decisions

None

# How to use this image

An example git layout is below:

```
|-- README.md
|-- defaults
|   `-- main.yml
|-- handlers
|   `-- main.yml
|-- meta
|   `-- main.yml
|-- molecule
|   `-- default
|       |-- Dockerfile.j2
|       |-- INSTALL.rst
|       |-- molecule.yml
|       |-- playbook.yml
|       |-- requirements.yml
|       `-- tests
|           `-- test_default.py
|-- tasks
|   `-- main.yml
`-- templates
    |-- backup.sh.j2
    |-- config.rb.j2
    `-- models
        `-- backup.rb.j2


```

## Start an instance

### Docker drivers

```console
# export ROLE_NAME=<your role>
# docker run -it -v /run/docker.sock:/run/docker.sock -v `pwd`:/${ROLE_NAME} -w /${ROLE_NAME}  ciscosecuritytrustops/ansible-molecule
# molecule test
```

## Environment Variables



# Caveats

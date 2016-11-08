Minimal possible changes around an ubuntu system (provided by cloud images, see [source](https://github.com/tianon/docker-brew-ubuntu-core/blob/52c8214ecac89d45592d16ce7c14ef82ac7b0822/update.sh)).

Tries to behave as much like a real ubuntu system as possible.

Based on:

* https://github.com/solita/docker-systemd

needs special flags to be started:

```
docker run --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro -it --security-opt=seccomp:unconfined --tmpfs /run --tmpfs /run/lock dalehamel/ubuntu-docker-systemd-minimal
```

Useful docs:

* https://rhatdan.wordpress.com/2014/04/30/running-systemd-within-a-docker-container/

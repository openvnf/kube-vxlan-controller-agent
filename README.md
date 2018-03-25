# Kube VXLAN Controller Agent

Implementation of the Agent for the [Kube VXLAN Controller].

Based on the [Pause] container the main executable of which is waiting for any
of SIGTERM, SIGINT or SIGCHLD signals and exits once received. This allows a
container to live in a Kuberenetes pod and provide necessary tools for the
VXLAN Controller to be executed in the pod.

The Controller expects the "ip" and "bridge" commands available on the pod for
setting up VXLAN interfaces and creating forwarding database entries. Therefore
the Agent image extends the Pause one with the "iproute2" package.

<!-- Links -->

[Kube VXLAN Controller]: https://gitlab.tpip.net/aalferov/kube-vxlan-controller
[Pause]: https://gitlab.tpip.net/aalferov/pause

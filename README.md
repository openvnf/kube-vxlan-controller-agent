# Kube VXLAN Controller Agent

Implementation of the Agent for the
[Kube VXLAN Controller](https://gitlab.tpip.net/aalferov/kube-vxlan-controller).

The main executable is waiting for any of SIGTERM, SIGINT or SIGCHLD signals
and exits once received. This allows a container to live in a Kuberenetes pod
and provide necessary tools for the VXLAN Controller to be executed in the pod.

Currently an Agent container provides the "iproute2" packet to let the
Controller execute the "ip" and "bridge" commands for setting up VXLAN
interfaces and creating peer forwarding database entries.

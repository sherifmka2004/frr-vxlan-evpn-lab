#!/usr/bin/env bash
# deploy.sh — bring up the full FRR VXLAN/BGP EVPN lab from scratch
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LAB_DIR="/opt/frr-lab"

echo "[1/3] Copying configs and topology..."
mkdir -p "$LAB_DIR/configs"
cp -r "$REPO_DIR/configs/"* "$LAB_DIR/configs/"
cp "$REPO_DIR/topology.yml"  "$LAB_DIR/topology.yml"

echo "[2/3] Deploying ContainerLab topology..."
cd "$LAB_DIR"
containerlab deploy -t topology.yml --reconfigure

echo "[3/3] Waiting 30s for OSPF/BGP convergence..."
sleep 30

echo ""
echo "=== OSPF neighbors ==="
for r in r1 r2 r3; do
  echo -n "  $r: "
  docker exec clab-frr-lab-$r vtysh -c "show ip ospf neighbor" 2>/dev/null \
    | awk '/Full/{printf $1" (Full) "}'; echo
done

echo ""
echo "=== BGP EVPN sessions ==="
for r in r1 r2 r3; do
  echo -n "  $r: "
  docker exec clab-frr-lab-$r vtysh -c "show bgp l2vpn evpn summary" 2>/dev/null \
    | awk '/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/{printf $1" ("$10") "}'; echo
done

echo ""
echo "=== EVPN IMET routes on R1 ==="
docker exec clab-frr-lab-r1 vtysh -c "show bgp l2vpn evpn route type multicast" 2>/dev/null \
  | grep "^\*"

echo ""
echo "Lab is up. Connect to a router with:"
echo "  docker exec -it clab-frr-lab-r1 vtysh"
echo "Test host reachability with:"
echo "  docker exec clab-frr-lab-host1 ping -c3 10.100.0.2"

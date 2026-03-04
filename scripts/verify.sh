#!/usr/bin/env bash
# verify.sh — run a full sanity check on the running lab
set -euo pipefail

PASS=0; FAIL=0

check() {
  local desc=$1; shift
  if eval "$@" &>/dev/null; then
    echo "  PASS  $desc"
    ((PASS++))
  else
    echo "  FAIL  $desc"
    ((FAIL++))
  fi
}

echo "=== Underlay (OSPF) ==="
check "R1-R2 OSPF Full" "docker exec clab-frr-lab-r1 vtysh -c 'show ip ospf neighbor' | grep 2.2.2.2 | grep Full"
check "R1-R3 OSPF Full" "docker exec clab-frr-lab-r1 vtysh -c 'show ip ospf neighbor' | grep 3.3.3.3 | grep Full"
check "R2-R3 OSPF Full" "docker exec clab-frr-lab-r2 vtysh -c 'show ip ospf neighbor' | grep 3.3.3.3 | grep Full"

echo ""
echo "=== Control Plane (BGP EVPN) ==="
check "R1 BGP to R2 Established" "docker exec clab-frr-lab-r1 vtysh -c 'show bgp l2vpn evpn summary' | grep 2.2.2.2 | grep -v Active"
check "R1 BGP to R3 Established" "docker exec clab-frr-lab-r1 vtysh -c 'show bgp l2vpn evpn summary' | grep 3.3.3.3 | grep -v Active"
check "R1 IMET routes (3 VTEPs)"  "docker exec clab-frr-lab-r1 vtysh -c 'show bgp l2vpn evpn route type multicast' | grep -c '^\*' | grep -q 3"

echo ""
echo "=== Data Plane (VXLAN) ==="
check "host1 → host2 ping" "docker exec clab-frr-lab-host1 ping -c2 -W2 10.100.0.2"
check "host2 → host1 ping" "docker exec clab-frr-lab-host2 ping -c2 -W2 10.100.0.1"

echo ""
echo "Result: $PASS passed, $FAIL failed"
[ "$FAIL" -eq 0 ]

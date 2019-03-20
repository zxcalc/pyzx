// Initial wiring: [4 0 2 8 1 5 6 7 3]
// Resulting wiring: [4 0 2 8 1 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[1], q[2];
cx q[3], q[4];

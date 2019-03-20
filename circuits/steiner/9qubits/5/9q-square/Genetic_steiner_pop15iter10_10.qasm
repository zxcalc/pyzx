// Initial wiring: [4, 5, 0, 8, 1, 3, 6, 7, 2]
// Resulting wiring: [4, 5, 0, 8, 1, 3, 6, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[8];
cx q[6], q[5];
cx q[7], q[4];
cx q[5], q[0];

// Initial wiring: [4, 5, 6, 1, 7, 0, 3, 8, 2]
// Resulting wiring: [4, 5, 6, 1, 7, 0, 3, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[2], q[1];
cx q[5], q[0];

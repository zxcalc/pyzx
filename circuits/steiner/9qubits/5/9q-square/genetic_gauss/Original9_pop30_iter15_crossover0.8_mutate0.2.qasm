// Initial wiring: [4, 8, 2, 1, 0, 3, 6, 7, 5]
// Resulting wiring: [4, 8, 2, 1, 0, 3, 6, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[0];
cx q[5], q[4];
cx q[6], q[1];
cx q[6], q[7];
cx q[2], q[6];

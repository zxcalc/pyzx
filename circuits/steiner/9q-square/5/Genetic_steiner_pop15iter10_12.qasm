// Initial wiring: [3, 2, 8, 0, 1, 6, 4, 5, 7]
// Resulting wiring: [3, 2, 8, 0, 1, 6, 4, 5, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[4];
cx q[6], q[5];
cx q[3], q[2];
cx q[2], q[1];

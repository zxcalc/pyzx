// Initial wiring: [4, 3, 6, 5, 1, 7, 0, 2, 8]
// Resulting wiring: [4, 3, 6, 5, 1, 7, 0, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[4], q[1];
cx q[5], q[4];
cx q[2], q[1];
cx q[1], q[0];

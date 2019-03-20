// Initial wiring: [4, 6, 1, 7, 3, 5, 2, 8, 0]
// Resulting wiring: [4, 6, 1, 7, 3, 5, 2, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[0], q[5];
cx q[8], q[7];
cx q[7], q[6];

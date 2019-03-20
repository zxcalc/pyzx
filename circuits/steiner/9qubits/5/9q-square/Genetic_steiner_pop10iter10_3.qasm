// Initial wiring: [1, 4, 5, 0, 2, 6, 8, 7, 3]
// Resulting wiring: [1, 4, 5, 0, 2, 6, 8, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[8], q[7];
cx q[7], q[4];
cx q[8], q[7];
cx q[5], q[4];
cx q[2], q[1];

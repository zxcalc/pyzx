// Initial wiring: [0, 4, 3, 2, 6, 5, 1, 7, 8]
// Resulting wiring: [0, 4, 3, 2, 6, 5, 1, 7, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[3], q[8];
cx q[2], q[3];
cx q[7], q[8];
cx q[3], q[8];
cx q[8], q[3];

// Initial wiring: [8, 2, 1, 0, 4, 3, 7, 5, 6]
// Resulting wiring: [8, 2, 1, 0, 4, 3, 7, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[0], q[5];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[0], q[5];
cx q[8], q[7];
cx q[2], q[1];

// Initial wiring: [6, 4, 7, 8, 2, 5, 3, 0, 1]
// Resulting wiring: [6, 4, 7, 8, 2, 5, 3, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[8];
cx q[4], q[5];
cx q[3], q[5];
cx q[2], q[6];
cx q[6], q[2];
cx q[0], q[8];
cx q[0], q[6];
cx q[6], q[0];
cx q[0], q[7];

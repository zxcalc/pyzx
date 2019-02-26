// Initial wiring: [8, 1, 5, 3, 4, 6, 7, 2, 0]
// Resulting wiring: [8, 1, 5, 3, 4, 6, 7, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[0], q[5];
cx q[8], q[7];

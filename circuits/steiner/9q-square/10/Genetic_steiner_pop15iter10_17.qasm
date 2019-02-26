// Initial wiring: [8, 5, 3, 7, 6, 1, 2, 0, 4]
// Resulting wiring: [8, 5, 3, 7, 6, 1, 2, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[6], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[3], q[2];
cx q[2], q[1];
cx q[4], q[1];
cx q[3], q[2];

// Initial wiring: [5, 0, 3, 2, 6, 8, 7, 1, 4]
// Resulting wiring: [5, 0, 3, 2, 6, 8, 7, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[5], q[6];
cx q[7], q[8];
cx q[2], q[1];

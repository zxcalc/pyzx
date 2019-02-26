// Initial wiring: [2, 0, 4, 5, 1, 6, 8, 7, 3]
// Resulting wiring: [2, 0, 4, 5, 1, 6, 8, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[3], q[8];
cx q[6], q[5];
cx q[5], q[6];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[6];
cx q[3], q[2];
cx q[1], q[0];

// Initial wiring: [1, 8, 0, 5, 2, 6, 3, 7, 4]
// Resulting wiring: [1, 8, 0, 5, 2, 6, 3, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[3], q[8];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[4];
cx q[6], q[5];

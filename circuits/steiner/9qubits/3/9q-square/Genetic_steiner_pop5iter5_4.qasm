// Initial wiring: [0, 1, 3, 6, 5, 8, 2, 4, 7]
// Resulting wiring: [0, 1, 3, 6, 5, 8, 2, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[6], q[7];

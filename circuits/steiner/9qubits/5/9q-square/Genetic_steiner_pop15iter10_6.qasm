// Initial wiring: [8, 6, 5, 2, 7, 4, 0, 1, 3]
// Resulting wiring: [8, 6, 5, 2, 7, 4, 0, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[5];
cx q[5], q[6];
cx q[0], q[5];
cx q[6], q[7];
cx q[5], q[6];
cx q[8], q[3];

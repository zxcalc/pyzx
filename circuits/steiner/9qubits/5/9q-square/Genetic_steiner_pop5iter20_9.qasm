// Initial wiring: [8, 1, 5, 3, 4, 2, 6, 7, 0]
// Resulting wiring: [8, 1, 5, 3, 4, 2, 6, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[6], q[7];
cx q[5], q[6];
cx q[3], q[8];
cx q[6], q[5];
cx q[5], q[0];
cx q[6], q[5];

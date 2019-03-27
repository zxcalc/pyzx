// Initial wiring: [2, 8, 1, 3, 4, 5, 6, 7, 0]
// Resulting wiring: [2, 8, 1, 3, 4, 5, 6, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[6];
cx q[7], q[0];
cx q[7], q[3];
cx q[6], q[5];
cx q[2], q[5];

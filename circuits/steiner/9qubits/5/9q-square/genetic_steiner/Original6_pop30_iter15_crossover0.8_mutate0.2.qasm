// Initial wiring: [5, 8, 6, 7, 0, 1, 4, 2, 3]
// Resulting wiring: [5, 8, 6, 7, 0, 1, 4, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[8], q[7];
cx q[2], q[3];
cx q[1], q[4];
cx q[4], q[5];

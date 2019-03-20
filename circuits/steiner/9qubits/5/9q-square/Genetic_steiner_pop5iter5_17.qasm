// Initial wiring: [2, 6, 5, 1, 8, 4, 0, 7, 3]
// Resulting wiring: [2, 6, 5, 1, 8, 4, 0, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[6], q[5];
cx q[3], q[2];
cx q[8], q[3];

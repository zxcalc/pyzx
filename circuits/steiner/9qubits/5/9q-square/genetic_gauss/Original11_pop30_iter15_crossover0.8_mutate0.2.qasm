// Initial wiring: [5, 2, 3, 7, 1, 4, 6, 0, 8]
// Resulting wiring: [5, 2, 3, 7, 1, 4, 6, 0, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[8], q[3];
cx q[6], q[8];
cx q[0], q[5];
cx q[3], q[6];

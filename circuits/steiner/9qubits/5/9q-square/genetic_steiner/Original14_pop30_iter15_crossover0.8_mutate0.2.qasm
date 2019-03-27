// Initial wiring: [5, 6, 0, 7, 3, 4, 1, 2, 8]
// Resulting wiring: [5, 6, 0, 7, 3, 4, 1, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[4], q[7];
cx q[1], q[4];
cx q[0], q[5];
cx q[0], q[1];

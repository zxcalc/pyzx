// Initial wiring: [0, 6, 7, 1, 3, 4, 5, 2, 8]
// Resulting wiring: [0, 6, 7, 1, 3, 4, 5, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[4];
cx q[4], q[5];
cx q[8], q[7];

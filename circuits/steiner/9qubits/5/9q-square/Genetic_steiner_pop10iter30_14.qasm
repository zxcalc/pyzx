// Initial wiring: [8, 0, 2, 3, 4, 7, 1, 5, 6]
// Resulting wiring: [8, 0, 2, 3, 4, 7, 1, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[7], q[4];
cx q[3], q[2];
cx q[8], q[3];
cx q[7], q[8];

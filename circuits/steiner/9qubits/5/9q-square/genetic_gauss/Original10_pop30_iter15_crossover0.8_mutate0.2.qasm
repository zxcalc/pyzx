// Initial wiring: [8, 7, 0, 3, 6, 1, 5, 2, 4]
// Resulting wiring: [8, 7, 0, 3, 6, 1, 5, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[5], q[3];
cx q[1], q[5];
cx q[3], q[8];
cx q[0], q[7];

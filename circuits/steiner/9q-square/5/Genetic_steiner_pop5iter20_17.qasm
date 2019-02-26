// Initial wiring: [8, 2, 3, 1, 7, 6, 4, 0, 5]
// Resulting wiring: [8, 2, 3, 1, 7, 6, 4, 0, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[8];
cx q[2], q[3];
cx q[7], q[6];

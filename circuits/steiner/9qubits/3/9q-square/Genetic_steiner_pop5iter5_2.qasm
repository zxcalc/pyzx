// Initial wiring: [8, 1, 4, 7, 6, 0, 3, 2, 5]
// Resulting wiring: [8, 1, 4, 7, 6, 0, 3, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[7];
cx q[1], q[4];
cx q[7], q[8];
cx q[7], q[6];

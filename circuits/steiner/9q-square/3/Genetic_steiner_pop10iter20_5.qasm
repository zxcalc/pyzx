// Initial wiring: [8, 2, 4, 0, 6, 7, 1, 3, 5]
// Resulting wiring: [8, 2, 4, 0, 6, 7, 1, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[4], q[3];

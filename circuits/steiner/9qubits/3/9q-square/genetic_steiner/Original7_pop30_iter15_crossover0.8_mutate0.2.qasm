// Initial wiring: [8, 1, 0, 6, 7, 4, 2, 5, 3]
// Resulting wiring: [8, 1, 0, 6, 7, 4, 2, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[7], q[4];
cx q[2], q[3];

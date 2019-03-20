// Initial wiring: [8, 0, 1, 5, 2, 3, 4, 7, 6]
// Resulting wiring: [8, 0, 1, 5, 2, 3, 4, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[8], q[3];
cx q[7], q[8];
cx q[5], q[0];

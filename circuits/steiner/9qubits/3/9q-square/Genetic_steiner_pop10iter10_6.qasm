// Initial wiring: [8, 5, 0, 6, 7, 2, 4, 1, 3]
// Resulting wiring: [8, 5, 0, 6, 7, 2, 4, 1, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[8], q[3];
cx q[5], q[0];

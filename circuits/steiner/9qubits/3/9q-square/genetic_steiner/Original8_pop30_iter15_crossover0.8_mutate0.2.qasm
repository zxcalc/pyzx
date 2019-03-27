// Initial wiring: [8, 1, 3, 2, 4, 6, 7, 5, 0]
// Resulting wiring: [8, 1, 3, 2, 4, 6, 7, 5, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[4], q[7];
cx q[4], q[5];

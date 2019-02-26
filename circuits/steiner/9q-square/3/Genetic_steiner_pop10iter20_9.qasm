// Initial wiring: [5, 1, 7, 6, 4, 3, 0, 2, 8]
// Resulting wiring: [5, 1, 7, 6, 4, 3, 0, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[4], q[7];
cx q[4], q[3];

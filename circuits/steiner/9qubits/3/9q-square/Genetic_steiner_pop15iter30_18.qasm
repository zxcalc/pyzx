// Initial wiring: [1, 6, 7, 4, 0, 8, 3, 2, 5]
// Resulting wiring: [1, 6, 7, 4, 0, 8, 3, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[4], q[3];
cx q[3], q[2];

// Initial wiring: [1, 8, 6, 0, 4, 2, 5, 7, 3]
// Resulting wiring: [1, 8, 6, 0, 4, 2, 5, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[4], q[7];

// Initial wiring: [0, 8, 2, 4, 7, 1, 3, 6, 5]
// Resulting wiring: [0, 8, 2, 4, 7, 1, 3, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[7];
cx q[3], q[4];
cx q[3], q[2];

// Initial wiring: [2, 0, 5, 3, 8, 6, 1, 7, 4]
// Resulting wiring: [2, 0, 5, 3, 8, 6, 1, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[5];
cx q[5], q[6];
cx q[8], q[7];
cx q[4], q[1];

// Initial wiring: [2, 1, 8, 5, 6, 0, 7, 3, 4]
// Resulting wiring: [2, 1, 8, 5, 6, 0, 7, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[8], q[7];
cx q[8], q[3];

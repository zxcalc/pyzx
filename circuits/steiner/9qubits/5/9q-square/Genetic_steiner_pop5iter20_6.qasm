// Initial wiring: [2, 3, 5, 4, 1, 0, 8, 7, 6]
// Resulting wiring: [2, 3, 5, 4, 1, 0, 8, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[8], q[7];
cx q[6], q[5];
cx q[5], q[4];
cx q[1], q[0];

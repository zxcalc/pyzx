// Initial wiring: [7, 1, 5, 6, 0, 8, 2, 4, 3]
// Resulting wiring: [7, 1, 5, 6, 0, 8, 2, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[5], q[6];
cx q[3], q[8];
cx q[8], q[7];
cx q[1], q[0];

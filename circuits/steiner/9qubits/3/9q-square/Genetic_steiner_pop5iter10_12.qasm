// Initial wiring: [7, 6, 1, 0, 3, 5, 2, 8, 4]
// Resulting wiring: [7, 6, 1, 0, 3, 5, 2, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[1], q[4];
cx q[5], q[6];
cx q[8], q[7];

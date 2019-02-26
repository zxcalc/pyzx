// Initial wiring: [7, 3, 5, 6, 2, 8, 4, 0, 1]
// Resulting wiring: [7, 3, 5, 6, 2, 8, 4, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[7];
cx q[7], q[8];
cx q[2], q[1];

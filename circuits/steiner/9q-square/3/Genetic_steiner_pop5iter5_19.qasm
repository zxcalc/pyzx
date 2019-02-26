// Initial wiring: [2, 3, 4, 8, 1, 0, 6, 7, 5]
// Resulting wiring: [2, 3, 4, 8, 1, 0, 6, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[6];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[7], q[8];

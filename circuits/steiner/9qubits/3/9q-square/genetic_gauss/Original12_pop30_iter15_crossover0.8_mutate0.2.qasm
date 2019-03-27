// Initial wiring: [7, 1, 5, 4, 6, 2, 3, 8, 0]
// Resulting wiring: [7, 1, 5, 4, 6, 2, 3, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[3], q[7];
cx q[4], q[6];

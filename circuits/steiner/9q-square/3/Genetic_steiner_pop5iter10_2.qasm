// Initial wiring: [7, 0, 8, 2, 4, 1, 6, 5, 3]
// Resulting wiring: [7, 0, 8, 2, 4, 1, 6, 5, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[5], q[6];
cx q[3], q[8];

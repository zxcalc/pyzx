// Initial wiring: [1, 8, 6, 7, 3, 0, 4, 2, 5]
// Resulting wiring: [1, 8, 6, 7, 3, 0, 4, 2, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[4], q[7];
cx q[8], q[3];

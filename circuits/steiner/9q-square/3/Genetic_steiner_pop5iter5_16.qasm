// Initial wiring: [7, 0, 5, 3, 6, 8, 4, 1, 2]
// Resulting wiring: [7, 0, 5, 3, 6, 8, 4, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[0], q[5];
cx q[8], q[7];

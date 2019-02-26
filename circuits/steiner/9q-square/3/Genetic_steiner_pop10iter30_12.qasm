// Initial wiring: [7, 5, 4, 8, 6, 0, 1, 3, 2]
// Resulting wiring: [7, 5, 4, 8, 6, 0, 1, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[7], q[8];
cx q[4], q[7];

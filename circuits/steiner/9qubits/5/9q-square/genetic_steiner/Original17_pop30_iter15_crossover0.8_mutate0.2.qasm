// Initial wiring: [2, 3, 1, 5, 7, 6, 8, 0, 4]
// Resulting wiring: [2, 3, 1, 5, 7, 6, 8, 0, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[8];
cx q[2], q[3];
cx q[1], q[2];

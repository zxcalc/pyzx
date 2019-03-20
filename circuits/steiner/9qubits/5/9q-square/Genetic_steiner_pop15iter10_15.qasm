// Initial wiring: [2, 0, 8, 6, 1, 3, 5, 7, 4]
// Resulting wiring: [2, 0, 8, 6, 1, 3, 5, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[3], q[4];
cx q[8], q[7];
cx q[2], q[1];

// Initial wiring: [5, 4, 8, 3, 7, 2, 0, 1, 6]
// Resulting wiring: [5, 4, 8, 3, 7, 2, 0, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[8], q[7];
cx q[6], q[2];
cx q[2], q[5];
cx q[1], q[8];

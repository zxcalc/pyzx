// Initial wiring: [6, 8, 7, 2, 1, 3, 5, 4, 0]
// Resulting wiring: [6, 8, 7, 2, 1, 3, 5, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[6], q[7];
cx q[6], q[5];
cx q[8], q[3];
cx q[1], q[0];

// Initial wiring: [3, 2, 8, 7, 6, 5, 0, 4, 1]
// Resulting wiring: [3, 2, 8, 7, 6, 5, 0, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[2];
cx q[4], q[5];
cx q[6], q[7];
cx q[3], q[2];
cx q[2], q[1];

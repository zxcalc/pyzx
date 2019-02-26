// Initial wiring: [5, 7, 2, 0, 1, 4, 3, 6, 8]
// Resulting wiring: [5, 7, 2, 0, 1, 4, 3, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[7], q[6];
cx q[6], q[5];
cx q[3], q[2];
cx q[4], q[1];

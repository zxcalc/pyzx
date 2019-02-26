// Initial wiring: [2, 7, 1, 3, 4, 0, 5, 6, 8]
// Resulting wiring: [2, 7, 1, 3, 4, 0, 5, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[8];
cx q[2], q[3];
cx q[7], q[6];
cx q[2], q[1];

// Initial wiring: [5, 0, 3, 6, 1, 7, 8, 2, 4]
// Resulting wiring: [5, 0, 3, 6, 1, 7, 8, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[5], q[3];
cx q[6], q[5];
cx q[2], q[4];
cx q[0], q[3];
cx q[1], q[8];
cx q[5], q[7];
cx q[4], q[6];

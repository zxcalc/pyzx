// Initial wiring: [2, 0, 5, 8, 3, 1, 6, 4, 7]
// Resulting wiring: [2, 0, 5, 8, 3, 1, 6, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[2], q[3];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[5], q[6];
cx q[3], q[8];
cx q[2], q[3];
cx q[3], q[8];
cx q[5], q[4];
cx q[6], q[5];

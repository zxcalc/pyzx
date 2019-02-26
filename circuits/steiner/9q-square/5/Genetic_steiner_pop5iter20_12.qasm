// Initial wiring: [3, 1, 8, 0, 6, 2, 5, 4, 7]
// Resulting wiring: [3, 1, 8, 0, 6, 2, 5, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[4], q[5];
cx q[7], q[6];
cx q[3], q[2];
cx q[4], q[1];
cx q[7], q[4];

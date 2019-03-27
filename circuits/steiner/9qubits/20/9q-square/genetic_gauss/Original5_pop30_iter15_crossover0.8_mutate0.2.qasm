// Initial wiring: [5, 1, 7, 4, 2, 8, 6, 3, 0]
// Resulting wiring: [5, 1, 7, 4, 2, 8, 6, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[3], q[2];
cx q[4], q[0];
cx q[6], q[4];
cx q[8], q[6];
cx q[6], q[0];
cx q[6], q[3];
cx q[8], q[5];
cx q[3], q[5];
cx q[2], q[3];
cx q[1], q[5];
cx q[0], q[1];
cx q[5], q[7];

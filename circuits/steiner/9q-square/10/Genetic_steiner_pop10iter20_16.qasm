// Initial wiring: [4, 7, 0, 8, 2, 1, 3, 5, 6]
// Resulting wiring: [4, 7, 0, 8, 2, 1, 3, 5, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[2], q[3];
cx q[7], q[6];
cx q[8], q[7];
cx q[6], q[7];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[3];
cx q[3], q[8];
cx q[5], q[0];
cx q[6], q[5];
cx q[7], q[6];

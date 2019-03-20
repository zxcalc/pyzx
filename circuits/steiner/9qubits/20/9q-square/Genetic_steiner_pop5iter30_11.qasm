// Initial wiring: [1, 4, 5, 7, 0, 6, 2, 8, 3]
// Resulting wiring: [1, 4, 5, 7, 0, 6, 2, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[1], q[4];
cx q[2], q[3];
cx q[0], q[1];
cx q[0], q[5];
cx q[6], q[7];
cx q[3], q[8];
cx q[2], q[3];
cx q[1], q[2];
cx q[3], q[8];
cx q[8], q[3];
cx q[3], q[2];
cx q[2], q[3];

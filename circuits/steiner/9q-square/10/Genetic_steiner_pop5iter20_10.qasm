// Initial wiring: [3, 2, 7, 8, 4, 0, 5, 1, 6]
// Resulting wiring: [3, 2, 7, 8, 4, 0, 5, 1, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[4], q[5];
cx q[3], q[8];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[3];
cx q[3], q[8];
cx q[3], q[2];
cx q[8], q[3];
cx q[7], q[8];
cx q[3], q[8];

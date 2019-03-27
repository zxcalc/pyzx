// Initial wiring: [6, 7, 0, 2, 5, 1, 8, 3, 4]
// Resulting wiring: [6, 7, 0, 2, 5, 1, 8, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[2], q[1];
cx q[4], q[3];
cx q[4], q[0];
cx q[5], q[3];
cx q[5], q[2];
cx q[6], q[0];
cx q[7], q[2];
cx q[8], q[7];
cx q[8], q[0];
cx q[6], q[1];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[6];
cx q[5], q[8];
cx q[4], q[8];
cx q[3], q[7];
cx q[2], q[8];
cx q[1], q[3];
cx q[3], q[1];
cx q[0], q[7];
cx q[0], q[4];
cx q[4], q[0];
cx q[2], q[6];

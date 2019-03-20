// Initial wiring: [1, 3, 8, 0, 5, 6, 2, 7, 4]
// Resulting wiring: [1, 3, 8, 0, 5, 6, 2, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[2], q[3];
cx q[4], q[5];
cx q[1], q[4];
cx q[0], q[5];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[0], q[5];
cx q[4], q[7];
cx q[3], q[4];
cx q[6], q[7];
cx q[2], q[3];
cx q[1], q[4];
cx q[5], q[4];
cx q[6], q[5];
cx q[5], q[6];
cx q[4], q[3];
cx q[7], q[4];
cx q[4], q[1];
cx q[7], q[4];
cx q[8], q[7];
